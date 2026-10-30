// Curriculum administration (ADR 0017, online-only per ADR 0003): upload with preview, edit text,
// questions and content languages. Platform administrator only; the SQL functions authorize,
// run in one transaction and write the audit events.
import { op } from "../_shared/api_op.ts";
import { assertValid, curriculumFromBody, LOCALE_CODE, validateCurriculum, validateTranslationFile } from "../_shared/curriculum.ts";
import type { Route } from "../_shared/http.ts";
import type { Json, Validator } from "../_shared/validation.ts";

const RESPONSE_TYPES = ["text", "person"];

const localeRule = (v: Validator, body: Json, field = "locale") => {
  v.text(field, { max: 3 });
  if (typeof body[field] === "string" && !LOCALE_CODE.test(body[field] as string)) {
    v.check(false, field, "El código de idioma son 2 o 3 letras minúsculas, p. ej. en.");
  }
};

const editRules = (entity: "module" | "value" | "question") => (v: Validator, body: Json) => {
  localeRule(v, body);
  if (entity === "question") {
    v.text("text", { max: 1000 }).oneOf("response_type", RESPONSE_TYPES, false)
      .oneOf("status", ["active", "inactive"], false).int("sort_order", 1, 99, false);
  } else {
    v.text("name", { max: 200 }).text("description", { max: 2000 });
    if (entity === "value") v.text("booklet_reference", { max: 200 });
  }
};

const editRoute = (entity: "module" | "value" | "question", segment: string): Route => ({
  method: "PATCH",
  pattern: `curriculum/${segment}/:id`,
  handler: op("curriculum_edit", {
    rules: editRules(entity),
    input: (body, { id }) => ({ ...body, entity, id }),
  }),
});

/** Previews or applies a Spanish curriculum upload; the same call serves both. */
const importRoute: Route = {
  method: "POST",
  pattern: "curriculum/import",
  handler: op("curriculum_import", {
    rules: (v) => v.bool("dry_run").text("source", { max: 80 }),
    input: (body) => {
      const curriculum = curriculumFromBody(body);
      assertValid(validateCurriculum(curriculum));
      return { curriculum, dry_run: body.dry_run === true, source: body.source };
    },
  }),
};

const translationsImportRoute: Route = {
  method: "POST",
  pattern: "curriculum/locales/:code/import",
  handler: op("curriculum_translations_import", {
    textParams: ["code"],
    rules: (v) => v.bool("dry_run").text("source", { max: 80 }),
    input: (body, { code }) => {
      const curriculum = curriculumFromBody(body);
      assertValid(validateTranslationFile(curriculum, code));
      return { locale: code, curriculum, dry_run: body.dry_run === true, source: body.source };
    },
  }),
};

export const curriculumRoutes: Route[] = [
  {
    method: "GET",
    pattern: "curriculum",
    handler: op("curriculum_get", {
      input: (_body, _params, url) => ({ locale: url.searchParams.get("locale") }),
    }),
  },
  importRoute,
  editRoute("module", "modules"),
  editRoute("value", "values"),
  editRoute("question", "questions"),
  {
    method: "POST",
    pattern: "curriculum/values/:id/questions",
    handler: op("curriculum_question_create", {
      rules: (v) =>
        v.text("code", { required: true, max: 40 }).text("text", { required: true, max: 1000 })
          .oneOf("response_type", RESPONSE_TYPES, false),
      input: (body, { id }) => ({ ...body, value_id: id }),
      status: 201,
    }),
  },
  {
    method: "POST",
    pattern: "curriculum/locales",
    handler: op("content_locale_add", {
      rules: (v, body) => {
        v.text("code", { required: true, max: 3 }).text("name", { required: true, min: 2, max: 60 });
        if (typeof body.code === "string" && !LOCALE_CODE.test(body.code.trim().toLowerCase())) {
          v.check(false, "code", "El código de idioma son 2 o 3 letras, p. ej. en.");
        }
      },
      status: 201,
      wrap: "locale",
    }),
  },
  {
    method: "PATCH",
    pattern: "curriculum/locales/:code",
    handler: op("content_locale_update", {
      textParams: ["code"],
      rules: (v) => v.text("name", { min: 2, max: 60 }).oneOf("status", ["active", "inactive"], false),
      input: (body, { code }) => ({ ...body, code }),
      wrap: "locale",
    }),
  },
  translationsImportRoute,
];
