# 0003 — Offline-first only for the session domain

## Context
The stakeholder answered "partially, connectivity is required" (PC-12) and "everyone has a phone"
(PC-06). The product owner expects many members to lack reliable internet during sessions, and
the KPIs depend on every session's data eventually arriving.

## Decision
The weekly session is offline-first: attendance, follow-up score, reflection answers, current
score and commitment can be captured with no internet and synchronized later.
Documented live-server-authoritative exceptions (online only):
- platform and organization administration (organizations, locations, tables, users, roles);
- invite creation and redemption;
- KPI dashboards and reports.

When the room has no internet, each member's app walks the session stages locally (self-paced).
When online, the facilitator opens each stage live through realtime updates and push.

## Alternatives considered
- Offline-tolerant only (queued writes, sessions need a connection to start): fails in rooms with
  no signal.
- Full offline-first including administration: conflict handling for concurrent admin edits is out
  of proportion to the need.
- Local peer-to-peer between facilitator and members: fragile across Android/iOS, high effort.
- Facilitator captures for everyone: contradicts PC-05 and answer privacy.

## Consequences
- First login and invite redemption need internet; a device must have synced its table roster
  before it can run an offline session.
