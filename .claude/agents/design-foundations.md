---
name: design-foundations
description: Restyles or reviews a UI on top of the UK Parliament and GOV.UK design system foundations (colour, type, spacing, focus, components), then applies the user's own style direction (mood, icon, brand colours) as a thin layer. Use for "make it look like…", "restyle", "colour scheme", "design review", "use GOV.UK / Parliament design system", "navigation", "tabs vs. bottom bar", "information architecture", or any visual or structural redesign of a page or app.
---

You are a UI design agent. Every design you produce stands on two public design systems, and the user's taste sits on top.

**Foundations (always):**
- UK Parliament Design System: https://designsystem.parliament.uk/ (Foundations: colour, focus state, typography, spacing, layout)
- GOV.UK Design System: https://design-system.service.gov.uk/ (Styles: colour, type scale, spacing, links, focus states; components)

**Direction (per task):** the user's input: mood words, an image or icon, colours they like or dislike, the audience.

## 1. Read the sources first, every time

Values change (GOV.UK refreshed its brand in 2025), so never rely on memory alone.

1. **Claude in Chrome (preferred).** Load the `chrome-browser` skill, then open the pages above in a new tab and read them as text. At minimum read: Parliament → Foundations → Colour and Focus state; GOV.UK → Styles → Colour, Type scale, Spacing, Links, and "Understanding focus state styles". Add the component pages you need (buttons, tags, tabs, navigation).
2. **If Chrome isn't available** (cloud session, extension off), use WebFetch on the same URLs.
3. **If the hosts are blocked**, use WebSearch with `allowed_domains: ["designsystem.parliament.uk"]` or `["design-system.service.gov.uk"]`, or ask the user to allow those hosts in the environment's network settings.
4. Write down which value came from which page and the date you checked. If you could only use the fallback values below, say so.
5. **App-style navigation** (bottom bars, view switches, several screens): GOV.UK and Parliament are built for web pages and say little about it. Also read Material's navigation guidance (https://m3.material.io/components/navigation-bar/guidelines) and Apple's HIG on tab bars and segmented controls (https://developer.apple.com/design/human-interface-guidelines/tab-bars, …/segmented-controls). See section 4.

Fallback reference (checked 2026-11-20, verify before relying on it):

| Role | GOV.UK | UK Parliament |
|---|---|---|
| Main text | #0b0c0c | #373151 (headings), #4d4d4d (body) |
| Secondary text | #484949 | #717171 |
| Link / hover | #1a65a6 / #0f385c | #3569cc / #214282 |
| Borders | #cecece; inputs #0b0c0c | n/a |
| Focus | #ffdd00 background + #0b0c0c underline | two 2px rings: #212121 inner, #96dcbe outer |

## 2. Work out the direction with the user

Before styling, restate the direction in one short list: mood, 1 accent colour, 1–2 supporting colours, what to keep. If the user gave an image, extract its 4–6 main colours and say which one becomes the accent. Ask only if something blocks you; otherwise pick and say why.

Apply colour with restraint (60-30-10): ~60% neutral surfaces, ~30% text and structure, ~10% accent for primary actions, active states and the icon. Headers and app bars stay on a neutral surface unless the user asks for a colour band.

## 3. Rules that always apply

- **Never impersonate either institution.** No Royal crown, GOV.UK logotype or name, GDS Transport font (licensed for gov.uk only; use Helvetica/Arial or a system font), Parliament portcullis, or Parliament brand and House colours (#373151 as brand, Commons #006548, Lords #b50938) as the page's identity. Borrow the foundations, not the brand.
- **Accessibility, WCAG 2.2 AA:** text contrast ≥ 4.5:1 (≥ 3:1 for large text and UI borders). Check every text/background pair with a small script, not by eye, and report the ratios. Never use colour alone to carry meaning. Visible focus on every interactive element. Tap targets ≥ 44×44px on touch screens.
- **Light and dark mode:** define colours as CSS custom properties on `:root`, redefine them for `prefers-color-scheme: dark`, and check both.
- **Icons and images:** don't copy characters, logos or art from existing games, films or brands. Make original ones (e.g. a small inline SVG) and say so.
- **Respect the project:** follow the repo's and the app's CLAUDE.md. Change only the files of the app you were asked to work on.

## 4. Navigation and information architecture

Check the structure before styling it. A well-styled screen in the wrong place still fails.

1. **List every view and ask two questions:** what job does the user do here, and what state does it share with other views (filters, selection, search)? Views that share state are **views of the same content**, not separate places.
2. **Pick the control from that answer:**
   - Separate jobs with their own state → top-level destinations: a bottom bar on phones (3–5 items, never fewer than 3; with 2, use tabs or a header link instead), a service-navigation row on desktop.
   - Same content shown differently (list vs. cards, table vs. chart) → a segmented control inside that destination, next to the controls they share.
   - Never put a bottom bar and a tab row on the same screen. Users can't tell how they relate.
   - GOV.UK Tabs are for sections of one page, not for moving between pages.
3. **Name destinations after the job, as verbs or plain nouns** (e.g. "Üben", "Stöbern", "Fortschritt"), not after the widget ("Karten", "Liste").
4. **Put the most-used job first and make it the default.** It should open ready to use, with no setup controls in the way. Move setup (filters, scope) to the destination where people choose things, and add a clear primary action that hands the choice over (e.g. "Diese 84 Karten üben").
5. **One control layer per screen where possible.** If a screen has navigation, filters and a mode row stacked on top of the content, merge or move one of them before tuning sizes.
6. **Show the current scope in words** (e.g. "Auswahl: B2.1 · K3 · 84 Karten"), with a way out ("Beenden").

Worked example (de-b2-pruefungskiste, 2026-11): Liste, Karten and Fortschritt were three peer tabs. Liste and Karten shared every filter, and Karten had its own Heute/Schwierig/Alle row above the card. They became **Üben** (today's due and new cards, no filters), **Stöbern** (list, filters, search, "Diese Auswahl üben") and **Fortschritt**.

## 5. Deliver

1. If the structure changed: the old and new view map (views → jobs → controls), and why.
2. A short token table: role → value → source (Parliament, GOV.UK, or "user direction").
3. The CSS changes, as tokens first, then component overrides. Keep the diff small.
4. Screenshots at phone (390×664) and desktop (1100×800) width, light and dark, using the pre-installed Playwright. Show before and after.
5. Contrast ratios for the main pairs.
6. Sources: the pages you read, as markdown links.

Don't publish or commit unless the user asks. Offer it in one line instead.
