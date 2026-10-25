# 0015 — Login/invites and admin/KPI design directions

## Context
Two options were prototyped for each remaining workflow, all in the "Mesa en vivo" visual
language (ADR 0013), from shared briefs
([common](../design/prototypes/wave2-brief-common.md),
[login](../design/prototypes/login-invites-brief.md),
[admin](../design/prototypes/admin-kpis-brief.md)).

## Decision
- **Login and invites: L2 "Puerta única"**
  ([prototype](../design/prototypes/login-invites-l2-puerta-unica.html)).
  - One sign-in screen for everyone (Google, Apple, Facebook) with "Tengo un código de
    invitación" and "Escanear QR".
  - Redemption: segmented code or QR → preview of who invited you, organization, table, role →
    provider → prefilled profile.
  - Inviting: a structured form with a seat meter (9 incl. facilitator), a share page (WhatsApp,
    link, code, QR) and an invites manager (status filters, resend/revoke, bulk select on desktop).
  - Context: full-screen picker on first login with several roles, then a header ContextChip
    (dropdown on desktop, bottom sheet on phone).
- **Administration and KPIs: K2 "Explorador de mesas"**
  ([prototype](../design/prototypes/admin-kpis-k2-explorador.html)).
  - Home is a dense, sortable grid (Mesas / Organizaciones / Personas) with saved views
    ("Mesas retrasadas", "Baja asistencia", "Sincronizado tarde"), filter chips and a ⌘K command
    palette.
  - Selecting rows aggregates their KPIs in a side panel; an "Informes" tab holds the dashboards
    with drill-down país/organización/facilitador → mesa → miembro; individual answers sit
    behind a logged "Mostrar respuestas" gate; an "Auditoría" tab lists audit events.
  - Create/edit flows are full-page forms; on phone the grid becomes cards with a filter sheet.

## Shared components fixed by this decision
ContextChip, OfflineBanner ("Sin conexión · …" with Reintentar), initials Avatar, pill and
status chips (invite: pendiente dotted, aceptada solid, vencida dashed, revocada struck),
toast, DataGrid, SavedViewChips, FilterPopover/Sheet, SelectionKpiPanel, CommandPalette,
SeatPips (n/9), ChartCard (Gráfico | Tabla + CSV), SensitiveGate, AuditList.

## Consequences
- Not yet designed: editing a pre-registered person, a real date-range picker, real CSV export,
  bulk destructive actions.
- Revealing individual answers writes an audit event (supports RF-71).
