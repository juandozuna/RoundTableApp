# 0001 — One Flutter app for Android, iOS and web

## Context
Members and facilitators use phones (PC-05, PC-13). Church admins and coordinators manage
organizations and read dashboards, often from a computer (P-113). The product must look good on
phone, tablet and desktop. The developer's main client skill is Flutter.

## Decision
A single Flutter codebase targets Android, iOS and web. Layout adapts through a centralized
responsive system (responsive_framework + flutter_screenutil). Role-based navigation decides which
features each user sees.

## Alternatives considered
- **Flutter mobile + Jaspr web**, sharing domain/data/Cubits via a Dart workspace (`jaspr_bloc`
  exists). Rejected: two presentation layers for one part-time developer, Jaspr is pre-1.0
  (0.22.0 at the time), and the mandated feature-first tree assumes a single Flutter app.
- **Flutter mobile + React admin**: two UI codebases and two languages.
- **Mobile/tablet only**: excludes desktop admin work.

## Consequences
- Dense admin tables need deliberate desktop layouts (breakpoints, data tables, keyboard support).
- Web bundle is the Flutter engine (CanvasKit/Wasm): slower first load than a DOM site; acceptable
  behind login.
- KPI charts use a Flutter chart library on every platform.
