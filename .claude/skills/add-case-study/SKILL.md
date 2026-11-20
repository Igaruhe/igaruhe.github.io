---
name: add-case-study
description: Add a new project case study to Yizhe Zhou's public portfolio (igaruhe.github.io). Use when asked to add, showcase or write up a project on the portfolio site.
---

# Add a case study

The site is public. Read `CLAUDE.md` first and follow its privacy rules.

1. **Gather facts from Yizhe, not from guesses.** Ask for: the problem, Yizhe's role, what the AI did, 2–3 decisions with the options considered, the result, and what may be shown publicly. Don't invent numbers, habits or outcomes.
2. **Check what is public.** No employer data, copyrighted content or other people's details. If the project uses private content, build a demo with sample content written for it (see `projects/b2-pruefungskiste/` and its export script in the source repo).
3. **Create the page.** Pick a slug (lowercase, hyphens). Copy `templates/case-study.html` to `projects/<slug>/index.html`, replace every CAPITALISED placeholder, keep the section order. Put screenshots in `projects/<slug>/img/` (from demos only, deviceScaleFactor 2, phone 390px wide, desktop 1100px wide). Every image needs alt text that says what it shows.
4. **Link it.** Add a card to "Selected work" in `index.html` (newest or strongest first; 2–4 cards in total).
5. **Check.** Run `bash scripts/check.sh`. Take phone and desktop screenshots of the new page in light and dark mode and show them to Yizhe.
6. **Commit** on a branch with subject `site: add <slug> case study`, then open a pull request. Publish (merge to `main`) only after Yizhe approves.
