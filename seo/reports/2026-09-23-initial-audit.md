# Initial audit: `/` (index.html), 2026-09-23

This audit only covers what can be checked from the source file (`index.html`
at commit `31466de`). Search Console, keyword data, competitor pages, speed
testing and AI-answer checks all need tools that aren't connected yet, so
those sections say **not run** instead of guessing.

## Recommended first change

**Give the page a next step, and track it as a named event.** Today a reader
who finishes the Trinity essay has nowhere to go. The page has no subscribe
form, no contact link and no analytics (`index.html`, whole file: no `<form>`,
no `<a>`, no `<script>`). Until that exists, nothing below can be measured as a
win or a miss. The owner has to pick what the next step is (see
`brief.md` → "What we sell").

## Pass 1: Can Google reach it, and is it fast

| Check | Result | Source |
|---|---|---|
| Static HTML with real text, no JS rendering needed | Pass | `index.html` |
| `lang` and viewport set | Pass | `index.html:2`, `index.html:5` |
| `<title>` | Weak: "The Study" doesn't describe the content or any query | `index.html:6` |
| Meta description | Missing | `index.html` `<head>` |
| Canonical URL | Missing (live URL unknown) | `index.html` `<head>` |
| `robots.txt` / `sitemap.xml` | Not in repo | repo root |
| Indexing status (URL Inspection) | **Not run**: no Search Console access | — |
| PageSpeed (mobile) | **Not run**. The page is one small HTML file with inline CSS, so speed is unlikely to be a problem | — |

## Pass 2: Competition

**Not run.** This needs the top 10 results for a confirmed main query
(DataForSEO) and full scrapes of those pages (Firecrawl). No main query is set
yet (`brief.md` → "Target topic").

## Pass 3: How the page reads for search and AI answers

- **One URL covers four unrelated topics.** Religious studies, medical studies, findings and fiction all share `/`. A page competes for one query at a time, so each essay should get its own URL. Right now only the Trinity essay has any content (`index.html:47-104`).
- **The heading doesn't match how people ask.** "The Trinity" (`index.html:48`) is a label. A question-shaped heading, e.g. "Is the Trinity inferred rather than stated in the Bible?", matches real searches.
- **The first line under the heading doesn't answer anything.** It opens on the arboretum story (`index.html:50`). The claim (that the Trinity is an inferred position, and why Matthew 24:36 matters to the author) doesn't come until paragraphs 4-6. A one- or two-sentence summary at the top, followed by the story, keeps the voice and gives search engines something to quote.
- **No author or date shown.** Readers and search engines both use these to judge personal essays.
- **Typos are frequent** enough to hurt trust. These are listed for the author to fix; the agent doesn't edit prose:
  fine→find, constantlt, ibterests, whoe, Enlgish, geammatically, isntances, theiughout, woukd, wlaking, theough, brasthed, decribed, explaination, Chrsitian, simitaneously, redemptikb, tbe, "is strangthens"→"it strengthens".
- **Schema:** not recommended as an AI-answer trick. `Article` markup can come later, once each essay has its own URL.
- **Off-site mentions (Parallel search):** **not run.**
- **AI Mode / Bing AI citations:** **not run.**

## Pass 4: Path from the page to the next step

- There's no next step anywhere on the page (see "Recommended first change").
- **Internal links:** the table of contents entries are plain `<p>` elements (`index.html:42-45`), not links. Three of the four sections they name don't exist on the page.
- **Tracking:** no analytics installed, so there's no named conversion event.

## Queue (one per week, after the first change ships)

1. Next step and named event *(owner decides what the next step is)*
2. Move the Trinity essay to its own URL, with a question-shaped H1 and a short answer at the top
3. Descriptive `<title>` and meta description for that URL
4. Make the table of contents real links, and drop or fill the empty sections
