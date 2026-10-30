# 0002 — Supabase as backend

## Context
Requirements: strict multi-tenant isolation (RNF-01..04), relational KPIs across organizations and
countries (RF-63..66), Google/Facebook/Apple login, audit trail, low operations for one
part-time developer, budget under ~US$100/month.

## Decision
Supabase: managed PostgreSQL with Row Level Security, Supabase Auth, Edge Functions (TypeScript)
for server logic, pg_cron for scheduled jobs. Business invariants (score 1–10 with 5 blocked,
max 9 active members, unique active membership, one session per table per slot) are enforced as
database constraints, and repeated in Edge Functions where requests are validated.

## Alternatives considered
- **Firebase end-to-end** (Firestore + Auth + Functions + FCM): least plumbing and built-in offline
  cache, but cross-organization KPI aggregation needs denormalized counters or a BigQuery export,
  hierarchical role rules are harder to express and test in Security Rules, and per-read pricing is
  harder to predict.
- **.NET API + PostgreSQL**: strongest backend skill and full control, but the developer would own
  hosting, auth-provider integration, sync endpoints and operations alone.
- **MongoDB Atlas Device Sync**: ruled out; MongoDB deprecated Device Sync.

## Consequences
- Tenant security lives in RLS policies, which need automated tests per role.
- Edge Functions run on Deno/TypeScript, a second language next to Dart.
- PowerSync connected to the same Postgres (ADR 0004); removed by ADR 0019.
