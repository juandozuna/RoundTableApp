# 0014 — The facilitator is also a participant

## Context
The facilitator starts and runs the round table, but is also part of it (product owner,
2026-10-25).

## Decision
- The facilitator answers everything a member answers: follow-up of their previous commitment
  and follow-up score, reflection answers, current-value score (5 blocked) and their own commitment.
- The facilitator counts toward the table limits: 3–9 people in total, facilitator included
  (at most 8 members plus the facilitator).
- The facilitator's answers follow the same visibility as any member's (PC-10) and the same
  offline, sync and late-sync rules (ADR 0003, 0005).
- On the facilitator phone, the UI offers both "Dirigir la mesa" (board and stage controls) and
  "Mis respuestas" (the member screens), and reminds the facilitator before "Cerrar respuestas"
  if their own answers are incomplete.

## Consequences
- Data model: the facilitator also has an active `round_table_members` row (participant), in
  addition to the facilitator assignment on the table; the max-9 constraint counts that row.
- Attendance and KPIs include the facilitator as a participant.
