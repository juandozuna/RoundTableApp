# Gold Roundtables — Live Session Flow prototypes (shared brief for all 4 design agents)

## Product
Gold Roundtables digitalizes a weekly values-formation program run by Iglesia Casa del Altísimo
across many organizations. A "mesa redonda" (round table) has 3–9 members + 1 facilitator, meets
weekly for max 30 minutes, and works one value per session. Program: 5 modules, 48 values
(modules 1–4 have 10 values, module 5 has 8). The app only CAPTURES data (attendance, answers,
scores, commitments); the booklet content stays on paper (PC-07).
Users are non-technical: big targets, plain language, guided steps, minimal free text.
UI copy in SPANISH (the app ships in Spanish). Annotations/notes for the reviewer may be English.

## The flow to prototype (first slice = live session)
Roles in the flow: Facilitador (runs the session on their phone) and Miembro (each member on their own phone).
Session order:
1. Facilitator opens today's session (shows table name, current value, previous value, scheduled time).
2. Attendance: facilitator marks each member Presente / Ausente (optional Tarde / Excusado).
3. Follow-up of the PREVIOUS value: each member sees last week's commitment, reports briefly what
   they did, and re-scores themselves on the previous value (the follow-up score).
   Edge case: member was absent last week → no prior commitment → show a gentle "no tienes
   compromiso previo" state and skip.
4. Current value: members answer reflection questions (sample placeholders: "¿Por qué te diste
   ese puntaje?", "¿Quién es para ti un ejemplo de este valor?"), then score themselves (initial score).
5. Commitment: each member defines ONE concrete, measurable action for the coming week.
6. Facilitator closes the answers stage, then closes the session (confirmation). Summary shown.

## Hard business rules to show in UI
- Score scale is integers 1–10 and **5 is blocked** (you must lean better or worse; show 5 as
  disabled with a short explanation).
- Follow-up happens exactly once, in the next session.
- 30-minute session (show elapsed time; informative, not blocking).
- Max 9 members per table.

## Online vs offline behaviour (must be visible in each prototype)
- ONLINE: the facilitator gates each stage live ("Abrir seguimiento", "Abrir valor actual",
  "Cerrar respuestas"); member phones wait on a "waiting for facilitator" state until the stage
  opens, and the facilitator sees live progress of who has answered.
- OFFLINE (no internet in the room): each member's app goes through the stages self-paced; the
  facilitator's controls become verbal guidance. Data is saved on-device.
- Sync states per device: "Guardado en este teléfono · pendiente de sincronizar", "Sincronizando",
  "Sincronizado", and "Sincronizado tarde" (arrived after the facilitator closed the session — accepted & flagged).
- Auto-attendance: a member marked Ausente who submits answers becomes Presente on sync — show this.
- A device can be up to 7 days without sync; show an "unsynced for >24h" warning.
- Provide a toggle in the prototype to switch Online/Offline and to simulate sync, so reviewers can see both.

## Prototype requirements
- ONE self-contained HTML file: inline CSS/JS/SVG, no CDN, no external fonts or images.
- Show the Facilitator phone and at least one Member phone SIDE BY SIDE, driven by shared state so
  actions on the facilitator phone update the member phone (simulate realtime). Let the reviewer
  switch which member is shown (sample table: 5 members, Spanish names).
- Working navigation through ALL steps 1–6 for both roles, with real states: waiting, empty,
  filled, validation error (e.g. trying 5, empty commitment), offline, pending sync, synced late,
  session closed summary.
- Responsive: phone frames side by side on desktop, stacked on narrow screens; also show how the
  facilitator screen adapts at tablet width if it fits your direction.
- Light and dark (prefers-color-scheme). Accessible contrast, keyboard-operable controls,
  touch targets ≥ 44px.
- A thin reviewer header (outside the phone frames) with: option name, one-line concept,
  Online/Offline toggle, "Simular sincronización", member switcher, reset, and a "References" strip
  naming the Mobbin apps/patterns that informed the design (only ones you actually found).
- Sample data (placeholders, clearly fictional): Mesa "Mesa Esperanza 03", Organización "Fundación Luz",
  Módulo 1, Valor actual "Valor 4 · Responsabilidad", Valor anterior "Valor 3 · Honestidad".

## Architecture fidelity
Not code yet, but the screens should be realistic for a Flutter app built with Material 3 widgets
(the real app will be Flutter + Cubit). Avoid patterns impossible in Flutter.
