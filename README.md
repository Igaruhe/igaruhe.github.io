# igaruhe.github.io

Yizhe Zhou's portfolio of AI and analytics projects: **https://igaruhe.github.io/**

| Page | What it is |
|---|---|
| `/` | Home: who I am, selected work, highlights from my day job |
| `/how-i-work-with-ai/` | The method behind my projects |
| `/projects/b2-pruefungskiste/` | Case study: a study app for the German B2 exam, with a [live demo](https://igaruhe.github.io/projects/b2-pruefungskiste/demo/) |

## How it's built

Plain HTML and CSS, no build step, published by GitHub Pages from `main`. Styles follow GOV.UK Design System foundations with one personal accent colour.

- Add a project: copy `templates/case-study.html` (or ask Claude to use the `add-case-study` skill).
- Before every commit: `bash scripts/check.sh` (banned private words, page basics, alt text, broken links).
- Rules for AI sessions: `CLAUDE.md`.

The B2 demo is generated from the private app's source with sample cards written for the demo; the textbook content is not in this repository.
