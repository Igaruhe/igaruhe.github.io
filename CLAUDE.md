# igaruhe.github.io

Yizhe Zhou's public portfolio: AI and analytics projects. Published by GitHub Pages at https://igaruhe.github.io/ from `main`.

## This repo is PUBLIC
- Everything here is on the internet. Never add copyrighted, confidential or employer-internal material: no textbook content, no company data, figures or screenshots from work, no personal data of others.
- Demos use sample content written for the demo. Screenshots come from those demos only.
- Only Yizhe's own work. This Claude account is shared with another person: never mix in anyone else's experience, projects or details.
- Facts about Yizhe come from Yizhe (CV, LinkedIn, messages). Don't invent details; if a sentence needs a fact you don't have, ask.

## Structure
```
index.html                 home: headline, selected work, at-work highlights
how-i-work-with-ai/        method page
projects/<slug>/           one case study per project: index.html, img/, optional demo/
templates/case-study.html  copy this for a new case study
assets/site.css            shared styles (GOV.UK foundations + one accent)
scripts/check.sh           run before every commit
```
Plain HTML and CSS, no build step. `.nojekyll` keeps GitHub Pages from processing files.

## Rules for every change
- Adding a project: use the `add-case-study` skill.
- Design changes: use the `design-foundations` agent. Keep contrast ≥ 4.5:1 in light and dark mode.
- Writing: plain English, short sentences, active voice. Case studies follow the template: snapshot, problem, 2–3 decisions, who did what, privacy, result.
- Run `bash scripts/check.sh` before every commit and fix what it reports.
- Show Yizhe screenshots (phone 390px and desktop 1100px) before publishing changes to `main`.
