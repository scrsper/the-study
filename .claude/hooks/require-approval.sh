#!/usr/bin/env bash
# PreToolUse hook: make the agent stop and ask before anything that publishes.
# Pushing to main publishes this site, so git push counts. So do CMS writes,
# URL submissions, and write-method HTTP calls.
input=$(cat)
tool=$(jq -r '.tool_name // ""' <<<"$input")
cmd=$(jq -r '.tool_input.command // ""' <<<"$input")

reason=""
if [[ "$tool" == "Bash" ]]; then
  if grep -Eq '(^|[;&|[:space:]])git[[:space:]]+push' <<<"$cmd"; then
    reason="git push publishes the site"
  elif grep -Eq 'indexing\.googleapis\.com|indexnow|searchconsole.*urlInspection|/sitemaps/' <<<"$cmd"; then
    reason="submits URLs to a search engine"
  elif grep -Eq 'api\.dataforseo\.com|api\.firecrawl\.dev|api\.parallel\.ai|searchAnalytics/query' <<<"$cmd"; then
    :  # read-only data APIs that happen to use POST
  elif grep -Eq 'curl.*(-X[[:space:]]*(POST|PUT|PATCH|DELETE)|--data|[[:space:]]-d[[:space:]])' <<<"$cmd"; then
    reason="write request to an external API"
  fi
elif grep -Eiq '^mcp__.*(webflow|wordpress|wp_|cms).*' <<<"$tool" \
  && grep -Eiq '(create|update|publish|delete|patch|post)' <<<"$tool"; then
  reason="edits a live CMS page"
elif grep -Eiq '^mcp__.*(publish|submit)' <<<"$tool"; then
  reason="publishes or submits content"
fi

if [[ -n "$reason" ]]; then
  jq -n --arg r "SEO approval rule: $reason. Ask the owner first." \
    '{hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"ask",permissionDecisionReason:$r}}'
fi
exit 0
