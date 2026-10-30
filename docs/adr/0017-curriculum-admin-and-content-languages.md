# 0017 — Curriculum administration and content languages

## Context
ADR 0016 gave the church a script to load the real curriculum. The product owner then asked for the
church to manage the curriculum itself, from the admin backoffice: **upload** it (the JSON format of
`curriculum.example.json`, CSV if cheap), **view and edit** it (modules, the 48 values, reflection
questions) and keep it in **several languages**.

## Decision
- **Base content stays as it is, in Spanish.** `curriculum_modules`, `curriculum_values` and
  `value_questions` keep their columns; Spanish is the default content language and the fallback
  for every other one. Nothing that already reads them (sessions, KPIs, history, notifications)
  changes.
- **Languages are rows, translations are rows.**
  - `content_locales (id, code, name, is_default, status)`; `code` is a 2–3 letter lowercase
    language code (`es`, `en`, `pt`). `es` is the default and cannot be edited as a translation.
    A language can be hidden (`inactive`) but never deleted.
  - `curriculum_translations (id, locale, entity_type, entity_id, name, description,
    question_text)` unique on `(locale, entity_type, entity_id)`, with `entity_type` in
    `module | value | question`. All text fields are optional: a missing or blank field falls back
    to the Spanish text **field by field**. A translation row with nothing left is deleted.
    A trigger rejects rows for the default language and for entities that do not exist.
    Why rows and not JSONB per entity: the sync stream, the completeness query and the upload diff
    all stay plain SQL over a flat table, and one language can be added or hidden without touching
    the base rows.
  - Only the text is translated. Codes, order, response type, booklet reference and the 1–48
    numbering are language-independent.
- **Syncing.** Both tables are reference data readable by every signed-in user (RLS select-only, no write
  grants); the app reads them through PostgREST (ADR 0019 replaced the PowerSync stream this ADR
  originally used). Devices receive translations like any other
  curriculum change, with no release.
- **Resolution on the device.** The app resolves text with SQL: the translation of the selected
  content language, else the Spanish base. The selection is a content-language setting kept in the
  local-only `local_sync_state` table (`content_locale`), set on first run from the device language
  and changeable in Settings ("Idioma del contenido", shown only when the church has defined more
  than one language). The queries read the setting, so changing it re-emits the session, Home and
  History at once, offline. This is **not** UI localization: screens stay Spanish ARB (ADR 0011);
  only curriculum text follows the content language. Server-generated text (KPI labels,
  notification bodies) and the PostgREST fallback of Home stay Spanish; extending them is a later
  step.
- **Administration is a platform-admin function, online only** (ADR 0003 exception, like the rest of
  the backoffice). Routes under `/admin/curriculum…` of the `admin` Edge Function call
  `api.curriculum_*` SQL functions: the function authorizes (`app.require_platform_admin`), takes an
  advisory lock, runs in one transaction and writes an audit event
  (`curriculum.imported | edited | translations_imported | translation_edited | question_created |
  locale_added | locale_updated`).
- **Upload is preview-then-apply, atomic and idempotent.**
  - One SQL function (`app.curriculum_apply(data, apply)`) computes the diff and, when asked,
    writes it, so the preview is exactly what apply does. The UI calls the same route with
    `dry_run: true`, shows the diff (new / changed / reactivated / deactivated, with before → after
    per field) and only then applies. Re-uploading the same file reports no changes and touches no
    row (`updated_at` is not bumped), so devices are not woken up.
  - Validation is the rule set of `scripts/lib/curriculum.mjs` (5 modules, 10/10/10/10/8 values,
    numbering 1–48, ≥1 question per value, question code `[a-z0-9_]{1,40}` unique per value, response
    type `text|person`). It is ported to TypeScript (`_shared/curriculum.ts`, friendly Spanish
    messages) and re-checked in SQL (`app.curriculum_problems`). A deno test asserts the TS port and
    the script agree; the script keeps working and stays the tool for command-line loads.
  - Ids stay stable and use the script's scheme (`md5('gold-roundtables:<label>')`), so uploads,
    the script and the seed converge on the same rows.
  - CSV (`kind,module,value,code,name,description,booklet_reference,text,response_type`, comma or
    semicolon) is converted to the JSON shape in the Edge Function; everything after that is shared.
- **History is protected.**
  - A question is never deleted: leaving the file or being switched off in the editor sets it
    `inactive` (it returns if the code comes back). Its text stays readable in past sessions.
  - Text-only edits are always allowed, including for values used by closed sessions. Structure
    changes that would change what recorded answers mean are refused: changing the response type of
    a question that has answers (`question_type_locked`), moving a value that sessions used to
    another module or position, and leaving a value without any active question
    (`question_last_active`). A refused upload applies nothing: the preview lists the refusals and
    applying answers `curriculum_locked`.
- **Translations are uploaded with the same file shape**, partial and keyed by module/value number
  and question code, plus a `locale` (or the route's language). The admin sees each language's
  completeness (translated / translatable texts), can add a language, hide it and edit any single
  text; a missing translation shows "Sin traducir" and users see Spanish.

## Consequences
- New migration `20261030000000_curriculum_admin.sql` (the PowerSync sync-rule
  changes of the original decision no longer apply, ADR 0019).
- The admin gets a "Currículo" section (platform administrators); coordinators do not see it.
- Adding a language is data, not a release. A language with a few texts is usable immediately;
  completeness tells the church what is left.
- Versioning of the curriculum (G-09) is still not built: edits are audited and non-structural, but
  there is no "restore previous version". Translating the UI itself, per-user UI locale switching and
  localized server messages remain out of scope.
