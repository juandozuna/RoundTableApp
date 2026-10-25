# Wave 2 — shared brief for 4 design agents (login/invites ×2, admin/KPIs ×2)

## Visual language (mandatory, all 4)
The chosen direction is Option B "Mesa en vivo": dark-first midnight violet with a light mode,
electric-violet accent, neon status colours coded also by line style/icon (never colour alone),
heavy 800-weight headings, ALL-CAPS tracked micro-labels, tabular numerals, initials avatars,
pill chips, bottom action dock on mobile.
- Reference implementation: /tmp/rt-proto/option-b.html (read its CSS tokens and components).
- Final light + dark tokens (WCAG AA verified): "Option B" section of /tmp/rt-proto/REGISTRY.md.
Reuse those tokens exactly; extend only when needed and note it.

## Product facts (do not contradict)
- Multi-tenant: Iglesia Casa del Altísimo (platform owner) manages Organizaciones. Roles:
  Administrador (church staff, all orgs, creates accounts in any org), Coordinador (creates tables
  and facilitator users in their org), Facilitador (runs a table, adds members to their own table,
  ALSO answers as a participant), Miembro.
- One person can hold several roles in several scopes (e.g. "Coordinador · Fundación Luz" and
  "Miembro · Mesa Esperanza 03"); the app has a context switcher.
- Table: 3–9 people INCLUDING the facilitator. Weekly, ≤30 min, one value per session.
  Program: 5 modules, 48 values. Score 1–10 with 5 blocked. Follow-up once, next session.
- Sign-in: Google, Apple, Facebook ONLY. No phone login, no SMS. Phone number is stored as
  unverified contact data.
- Members are pre-registered (Nombre, Apellido, Cargo si aplica, Correo, Teléfono) by a
  facilitator/coordinator, which creates an INVITE (link + short code, shareable e.g. via WhatsApp
  or QR). Signing in with any provider while redeeming the invite binds the identity.
- Administration, invites and KPI dashboards are ONLINE-ONLY: show a clear offline state.
  The session itself works offline (already designed).
- KPIs v1: valores completados; mejora estimada = follow-up score − initial score per value;
  asistencia; mesas activas/inactivas/retrasadas; count of "sincronizado tarde". Breakdowns by
  organización, país, ubicación, mesa, facilitador. Individual answers/scores visible to
  facilitator, coordinator and church admin. Multiple countries.
- UI copy in Spanish. Sample data must be clearly fictional (orgs like "Fundación Luz",
  "Colegio Horizonte", "Empresa Andina"; countries e.g. República Dominicana, Colombia, Guatemala).
- Real app = one Flutter app (Android, iOS, web) with Material 3; avoid patterns impossible in
  Flutter. Desktop web must feel native to desktop (keyboard, hover, dense tables) while phones
  stay touch-first.

## Prototype requirements (all 4)
- ONE self-contained HTML file in /tmp/rt-proto/wave2/ (inline CSS/JS/SVG; no CDN, fonts, images).
- Working navigation through the whole workflow with real states: empty, loading, filled,
  validation error, permission denied, offline, success.
- Reviewer header: option name + one-line concept, viewport switch (Teléfono 390 / Tablet 820 /
  Escritorio 1280) showing the SAME flow responsively, role/context switch where relevant,
  online/offline toggle, theme (auto/light/dark), reset, and a References strip citing only
  Mobbin apps/patterns you actually found (with the Mobbin URLs returned).
- Light + dark, WCAG AA, keyboard operable, touch targets ≥44px.
- Sanity-check JS (node --check on extracted script) and run a headless walkthrough if possible
  (Chrome: /Applications/Google Chrome.app/Contents/MacOS/Google Chrome). No runtime errors.
- Do NOT write in any git repository.
