# 0010 — KPIs from Postgres rollups, rendered in-app

## Context
The v1 national KPIs are values completed and estimated score improvement (PC-11). Success means
"real data instantly" (P-03).

## Decision
Postgres views and materialized rollups by table, location, organization, country and global,
refreshed after sync uploads and on a pg_cron schedule. The app reads them through PostgREST
(ADR 0008) and renders them per role scope with a Flutter chart library. KPI reads never hit the
transactional tables directly (RNF-19). Rollups expose `synced_late` counts (ADR 0005).

## Alternatives considered
- External BI (Metabase / Looker Studio): may be added later for deep analysis by the church.
