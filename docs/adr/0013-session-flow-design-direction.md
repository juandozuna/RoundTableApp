# 0013 — Session flow design direction: "Mesa en vivo"

## Context
Four interactive prototypes of the live session flow were built from a shared brief
([session-flow-brief.md](../design/prototypes/session-flow-brief.md)): A "Paso a paso" (guided
stepper), B "Mesa en vivo" (live room board), C "Conversación" (card/chat flow), D "Agenda de 30
minutos" (timeboxed agenda).

## Decision
Option B, "Mesa en vivo", is the design direction for the session flow
([prototype](../design/prototypes/session-flow-b-mesa-en-vivo.html)).

- Facilitator phone: a live round-table board, with members as avatar seats ringed by status
  (answered, pending, offline, synced late), a six-segment stage bar (Abrir · Lista · Seguimiento ·
  Valor · Compromiso · Cierre) used as the control, and a bottom action dock.
- Member phone: stage-driven screens with a persistent "La mesa está en: …" presence strip.
- Dark-first violet theme with a light mode. Status is coded by colour plus line style and icon
  (offline = dashed ring), never colour alone.
- Flutter mapping: RoundTable (Stack + Positioned seats), StageSegmentedBar, PresenceStrip,
  SyncPill, ScoreGrid (5 locked), action Dock, all built as shared design-system components
  (AGENTS.md §12).

## Consequences
- Seat layout must scale to 9 members and to small phones; this was not exercised by the prototype
  (5 members).
- The colour tokens in the prototype are the starting palette for `lib/core/theme`; contrast must be
  verified per AGENTS.md §12.
