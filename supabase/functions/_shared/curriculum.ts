// Curriculum file validation and CSV parsing (pure; no Deno/Supabase APIs). TypeScript port of
// scripts/lib/curriculum.mjs (a deno test checks that both agree); the database re-checks the
// same rules in app.curriculum_problems. See docs/implementation/curriculum-import.md.
import { ApiError } from "./errors.ts";
import type { Json } from "./validation.ts";

export const MODULE_SIZES = [10, 10, 10, 10, 8];
export const RESPONSE_TYPES = ["text", "person"];
export const MAX_UPLOAD_CHARS = 1_000_000;
const CODE_PATTERN = /^[a-z0-9_]{1,40}$/;
export const LOCALE_CODE = /^[a-z]{2,3}$/;

const isText = (v: unknown): v is string => typeof v === "string" && v.trim().length > 0 && !v.includes("\0");
const isOptionalText = (v: unknown) =>
  v === undefined || v === null || (typeof v === "string" && !v.includes("\0"));
const isObject = (v: unknown): v is Json => v !== null && typeof v === "object" && !Array.isArray(v);

/** Problems that make a Spanish curriculum file unimportable; empty means importable. */
export function validateCurriculum(data: unknown): string[] {
  const errors: string[] = [];
  if (!isObject(data) || !Array.isArray(data.modules)) {
    return ['El archivo debe ser un objeto con la lista "modules".'];
  }
  if (data.modules.length !== MODULE_SIZES.length) {
    errors.push(`Se esperaban ${MODULE_SIZES.length} módulos y hay ${data.modules.length}.`);
  }
  let expectedValue = 1;
  data.modules.forEach((module: unknown, index: number) => {
    const where = `modules[${index}]`;
    if (!isObject(module)) {
      errors.push(`${where} debe ser un objeto.`);
      return;
    }
    if (module.number !== index + 1) errors.push(`${where}.number debe ser ${index + 1} (módulos en orden).`);
    if (!isText(module.name)) errors.push(`${where}.name es obligatorio.`);
    if (!isOptionalText(module.description)) errors.push(`${where}.description debe ser texto.`);
    if (!Array.isArray(module.values)) errors.push(`${where}.values debe ser una lista.`);
    const values: unknown[] = Array.isArray(module.values) ? module.values : [];
    const expectedSize = MODULE_SIZES[index];
    if (expectedSize !== undefined && values.length !== expectedSize) {
      errors.push(`${where} debe tener ${expectedSize} valores y tiene ${values.length}.`);
    }
    values.forEach((value) => {
      const label = `${where} valor n.º ${isObject(value) ? value.number ?? "?" : "?"}`;
      if (!isObject(value)) {
        errors.push(`${where} tiene un valor que no es un objeto.`);
        expectedValue += 1;
        return;
      }
      if (value.number !== expectedValue) {
        errors.push(`${label}: el número debe ser ${expectedValue} (valores 1–48 en orden, sin huecos).`);
      }
      expectedValue += 1;
      if (!isText(value.name)) errors.push(`${label}: el nombre es obligatorio.`);
      if (!isOptionalText(value.description)) errors.push(`${label}: description debe ser texto.`);
      if (!isOptionalText(value.bookletReference)) errors.push(`${label}: bookletReference debe ser texto.`);
      validateQuestions(value, label, errors);
    });
  });
  return errors;
}

function validateQuestions(value: Json, label: string, errors: string[]) {
  if (!Array.isArray(value.questions) || value.questions.length === 0) {
    errors.push(`${label}: se necesita al menos una pregunta.`);
    return;
  }
  const codes = new Set<string>();
  value.questions.forEach((question: unknown, i: number) => {
    const q = `${label} pregunta[${i}]`;
    if (!isObject(question)) {
      errors.push(`${q} debe ser un objeto.`);
      return;
    }
    if (typeof question.code !== "string" || !CODE_PATTERN.test(question.code)) {
      errors.push(`${q}: code debe cumplir ${CODE_PATTERN}.`);
    } else if (codes.has(question.code)) {
      errors.push(`${q}: código repetido "${question.code}".`);
    } else {
      codes.add(question.code);
    }
    if (!isText(question.text)) errors.push(`${q}: el texto es obligatorio.`);
    if (question.responseType !== undefined && !RESPONSE_TYPES.includes(question.responseType as string)) {
      errors.push(`${q}: responseType debe ser ${RESPONSE_TYPES.join(" o ")}.`);
    }
  });
}

/**
 * Problems in a translation file: same shape as the curriculum file, but partial; every entry only
 * needs its key and the translated text. Existence of the keys is checked by the database.
 */
export function validateTranslationFile(data: unknown, locale?: string): string[] {
  const errors: string[] = [];
  if (!isObject(data) || !Array.isArray(data.modules)) {
    return ['El archivo debe ser un objeto con la lista "modules".'];
  }
  if (data.locale !== undefined && locale !== undefined && data.locale !== locale) {
    errors.push(`El archivo es del idioma "${data.locale}", no de "${locale}".`);
  }
  const textual = (obj: Json, key: string, where: string) => {
    if (obj[key] !== undefined && obj[key] !== null && (typeof obj[key] !== "string")) {
      errors.push(`${where}: ${key} debe ser texto.`);
    }
  };
  data.modules.forEach((module: unknown, i: number) => {
    const where = `modules[${i}]`;
    if (!isObject(module) || !Number.isInteger(module.number)) {
      errors.push(`${where}.number es obligatorio.`);
      return;
    }
    textual(module, "name", where);
    textual(module, "description", where);
    const values = module.values === undefined ? [] : module.values;
    if (!Array.isArray(values)) return void errors.push(`${where}.values debe ser una lista.`);
    values.forEach((value: unknown, j: number) => {
      const vw = `${where}.values[${j}]`;
      if (!isObject(value) || !Number.isInteger(value.number)) {
        errors.push(`${vw}.number es obligatorio.`);
        return;
      }
      textual(value, "name", vw);
      textual(value, "description", vw);
      const questions = value.questions === undefined ? [] : value.questions;
      if (!Array.isArray(questions)) return void errors.push(`${vw}.questions debe ser una lista.`);
      questions.forEach((question: unknown, k: number) => {
        const qw = `${vw}.questions[${k}]`;
        if (!isObject(question) || typeof question.code !== "string") {
          errors.push(`${qw}.code es obligatorio.`);
          return;
        }
        textual(question, "text", qw);
      });
    });
  });
  return errors;
}

export function assertValid(problems: string[]): void {
  if (problems.length === 0) return;
  throw new ApiError("curriculum_invalid", problems.slice(0, 5).join(" "), { problems: problems.slice(0, 50) });
}

// ── CSV ────────────────────────────────────────────────────────────────────────────────────────
// One row per module, value or question:
//   kind,module,value,code,name,description,booklet_reference,text,response_type
// "kind" is module | value | question. Comma or semicolon (Spanish Excel) delimited, quoted cells.

const CSV_COLUMNS = ["kind", "module", "value", "code", "name", "description", "booklet_reference", "text", "response_type"];

export function parseCsv(input: string): string[][] {
  const text = input.replace(/^﻿/, "");
  const firstLine = text.split(/\r?\n/, 1)[0] ?? "";
  const delimiter = (firstLine.match(/;/g)?.length ?? 0) > (firstLine.match(/,/g)?.length ?? 0) ? ";" : ",";
  const rows: string[][] = [];
  let row: string[] = [];
  let cell = "";
  let quoted = false;
  for (let i = 0; i < text.length; i++) {
    const c = text[i];
    if (quoted) {
      if (c === '"' && text[i + 1] === '"') {
        cell += '"';
        i++;
      } else if (c === '"') quoted = false;
      else cell += c;
    } else if (c === '"') quoted = true;
    else if (c === delimiter) {
      row.push(cell);
      cell = "";
    } else if (c === "\n" || c === "\r") {
      if (c === "\r" && text[i + 1] === "\n") i++;
      row.push(cell);
      cell = "";
      if (row.some((v) => v.trim() !== "")) rows.push(row);
      row = [];
    } else cell += c;
  }
  row.push(cell);
  if (row.some((v) => v.trim() !== "")) rows.push(row);
  return rows;
}

/** Converts the CSV layout above to the JSON file shape. Blank cells are left out. */
export function csvToCurriculum(csv: string): Json {
  const rows = parseCsv(csv);
  if (rows.length === 0) throw new ApiError("curriculum_invalid", "El archivo CSV está vacío.");
  const header = rows[0].map((h) => h.trim().toLowerCase());
  const missing = ["kind", "module", "value", "code", "name", "text"].filter((h) => !header.includes(h));
  if (missing.length) {
    throw new ApiError("curriculum_invalid", `Faltan columnas en el CSV: ${missing.join(", ")}.`, {
      expected: CSV_COLUMNS,
    });
  }
  const at = (row: string[], name: string) => (row[header.indexOf(name)] ?? "").trim();
  const modules = new Map<number, Json & { values: Map<number, Json & { questions: Json[] }> }>();
  const valueIndex = new Map<number, Json & { questions: Json[] }>();
  const problems: string[] = [];
  const set = (target: Json, key: string, value: string) => {
    if (value !== "") target[key] = value;
  };
  const intCell = (row: string[], name: string, line: number): number | null => {
    const raw = at(row, name);
    if (!/^\d+$/.test(raw)) {
      problems.push(`Línea ${line}: "${name}" debe ser un número.`);
      return null;
    }
    return Number(raw);
  };
  rows.slice(1).forEach((row, i) => {
    const line = i + 2;
    const kind = at(row, "kind").toLowerCase();
    if (kind === "module") {
      const number = intCell(row, "module", line);
      if (number === null) return;
      const module = { number, values: new Map() } as Json & { values: Map<number, Json & { questions: Json[] }> };
      set(module, "name", at(row, "name"));
      set(module, "description", at(row, "description"));
      modules.set(number, module);
    } else if (kind === "value") {
      const moduleNumber = intCell(row, "module", line);
      const number = intCell(row, "value", line);
      if (moduleNumber === null || number === null) return;
      const module = modules.get(moduleNumber) ??
        (modules.set(moduleNumber, { number: moduleNumber, values: new Map() } as never), modules.get(moduleNumber)!);
      const value = { number, questions: [] as Json[] } as Json & { questions: Json[] };
      set(value, "name", at(row, "name"));
      set(value, "description", at(row, "description"));
      set(value, "bookletReference", at(row, "booklet_reference"));
      module.values.set(number, value);
      valueIndex.set(number, value);
    } else if (kind === "question") {
      const number = intCell(row, "value", line);
      if (number === null) return;
      const value = valueIndex.get(number);
      if (!value) return void problems.push(`Línea ${line}: la pregunta es del valor ${number}, que no aparece antes.`);
      const question: Json = { code: at(row, "code") };
      set(question, "text", at(row, "text"));
      set(question, "responseType", at(row, "response_type"));
      value.questions.push(question);
    } else {
      problems.push(`Línea ${line}: "kind" debe ser module, value o question.`);
    }
  });
  if (problems.length) {
    throw new ApiError("curriculum_invalid", problems.slice(0, 5).join(" "), { problems: problems.slice(0, 50) });
  }
  return {
    modules: [...modules.values()].sort((a, b) => (a.number as number) - (b.number as number)).map((m) => ({
      ...m,
      values: [...m.values.values()].sort((a, b) => (a.number as number) - (b.number as number)),
    })),
  };
}

/** Reads the upload body: { curriculum } (JSON file contents) or { csv } (CSV text). */
export function curriculumFromBody(body: Json): Json {
  const csv = body.csv;
  if (csv !== undefined && csv !== null) {
    if (typeof csv !== "string" || csv.length > MAX_UPLOAD_CHARS) {
      throw new ApiError("curriculum_invalid", "El archivo CSV no es válido o es demasiado grande.");
    }
    return csvToCurriculum(csv);
  }
  if (!isObject(body.curriculum)) {
    throw new ApiError("curriculum_invalid", 'Envía el contenido del archivo en "curriculum" (JSON) o "csv".');
  }
  return body.curriculum;
}
