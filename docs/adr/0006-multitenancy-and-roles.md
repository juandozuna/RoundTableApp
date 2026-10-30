# 0006 — Shared-schema multi-tenancy, roles per scope

## Context
Roles (PC-03): Administrator (church staff, all organizations), Coordinator (creates tables and
facilitators in their organization), Facilitator (runs their table and adds its members), Member.
Organizations must never see each other's data (RF-05). Individual answers and scores are visible
to facilitator, coordinator and church administrator (PC-10).

## Decision
One Postgres database with `organization_id` on every tenant table and RLS on all of them.
Identity (`profiles`) is separate from memberships: one user can hold several role assignments
such as "Coordinator @ Org A" and "Member @ Table 3". The app offers a context switcher. Platform
administrators are a separate global role checked in RLS, never stored as an organization role.

## Consequences
- RLS derives scope from the membership tables (PowerSync sync rules did too until ADR 0019).
- National reports run through security-definer functions or rollups (ADR 0010), not raw tenant
  reads.
