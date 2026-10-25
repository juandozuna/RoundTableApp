# 0011 — Spanish first, i18n-ready, UTC + table timezone

## Decision
- v1 ships in Spanish; every user-facing string lives in ARB files so more languages are
  translation work only.
- Timestamps stored in UTC; each table stores its IANA timezone; schedules are expressed in the
  table's local time.
- Organizations carry country and region for KPI breakdowns.
- The pilot spans several countries. One Supabase region for now.
- Data-protection law and data residency are explicitly out of scope for now (product owner
  decision, 2026-10-25); revisit before national rollouts.
