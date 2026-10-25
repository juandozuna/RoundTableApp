# Workflow 2 — Administration and KPI dashboards (online-only)

Cover end to end, primarily desktop web (must also work on tablet and phone):
1. Church Administrador: global KPI overview (all orgs, by country), organizations list → create /
   pause / deactivate an organization (name, type, country, region, main contact), create its
   first Coordinador (via invite), drill into any organization.
2. Coordinador (own org only): locations → tables (create table: name/code, location, weekday +
   time + timezone, facilitator; centrally controlled scheduling), assign/change facilitator
   (history preserved), members per table (3–9 incl. facilitator; move member between tables with
   history; deactivate without deleting history), facilitator users.
3. KPI dashboards scoped by role: valores completados, mejora estimada (follow-up − initial),
   asistencia, mesas activas/inactivas/retrasadas, "sincronizado tarde" counts; filter by período,
   país, organización, ubicación, mesa, facilitador, módulo/valor; drill-down from aggregate →
   organización → mesa → miembro (individual scores and answers visible to these roles, clearly
   marked as sensitive); table toggle for every chart; export CSV (stub).
4. Audit log (who did what: altas, bajas, reasignaciones, cierres de sesión, cambios de rol).
States: empty org (no tables yet), loading skeletons, validation errors (e.g. 10th seat,
duplicate code, missing facilitator), permission denied (coordinator trying another org),
offline banner (admin is online-only), success toasts, confirm dialogs for destructive actions.
Charts hand-rolled in SVG with tooltips; no chart libraries.
