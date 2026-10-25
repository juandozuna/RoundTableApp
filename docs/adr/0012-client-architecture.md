# 0012 — Feature-first layered client architecture

## Decision
The Flutter client follows the architecture in [AGENTS.md](../../AGENTS.md): feature vertical
slices (presentation / domain / data); Widget → Cubit → Use case → domain service contract → data
service implementation → local and remote data sources → Retrofit; flutter_bloc (Cubit), Freezed,
json_serializable, GetIt + injectable, Dio + Retrofit, Drift, go_router, flutter_form_builder,
ARB localization, UUIDs for device-created ids.

## Project-specific adjustments
- PowerSync replaces the hand-written `isSynced` orchestration (ADR 0004).
- No `.properties.dart` generator for now; models declare only `.freezed.dart` and `.g.dart`.
- No ticket system and no pull requests are used in this repository; changes are pushed directly to `main` (see AGENTS.md §19).
