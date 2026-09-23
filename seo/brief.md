# SEO brief: The Study

The agent reads this file first on every run. It can only judge a page as well
as it understands what that page is for, so keep this file current.

## What the site is

"Scrsper's Study" is a personal writing site: essays on religious studies,
medical studies, interesting findings, and book ideas and short stories. It is
one static page (`index.html`) in the `scrsper/the-study` repo. It has no
build step and no CMS. Pushing to `main` publishes it.

## What we sell / what counts as a conversion

**Not defined yet. Fill this in before any SEO work starts.**

The guide's first rule: rankings are worth nothing if the page has no clear
next step. Right now the page has no signup, no contact link, no subscribe
button, and no way for a reader to come back. Pick one:

- [ ] Email / newsletter signup (for example Buttondown or Substack embed), tracked as `newsletter_signup`
- [ ] Contact / reply by email, tracked as `contact_click`
- [ ] Something else: ______

Conversion event name (must be a named event in analytics, not auto-captured):
`__________`

## Who reads it

- Who: ______ (e.g. lay Christians interested in early church history and theology)
- What they search right before they'd take the next step: ______

## Target topic

One topic someone would search when they're ready to act, not just curious.
Candidate from existing content: questions about the Trinity doctrine and
whether it is inferred from scripture (e.g. "is the trinity in the bible",
"Matthew 24:36 trinity"). Confirm with keyword data before committing.

## Pages in scope

| Page | Role | Main query | Next step on page |
|------|------|------------|-------------------|
| `/` (`index.html`) | Only page. Hosts the Trinity essay | TBD | None (fix first) |

## Rules for the agent

1. Every claim in a report comes with the URL or file it came from. If data is missing, say it's missing; don't guess.
2. Recommend ONE change per week. Never bundle a title, intro and links change in the same week.
3. Ignore ranking moves shorter than about two weeks. Don't touch a page that's doing well without a strong reason.
4. Never publish, push, edit a live page or submit a URL without the owner's explicit yes. The hook in `.claude/hooks/require-approval.sh` enforces this.
5. Treat schema as something you add when the page fits a rich result, not as a trick for AI answers. Don't add `llms.txt`.
6. Don't edit the author's prose or voice. Suggest wording; the owner makes the final read.
7. Append to `log.md`. Never delete or rewrite old entries.
8. Keep `weekly-run.md` frozen while a change is being measured.
