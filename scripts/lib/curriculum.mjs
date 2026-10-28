// Curriculum file validation and idempotent SQL generation (see docs/implementation/curriculum-import.md).
// Pure functions, no I/O: used by scripts/import-curriculum.mjs and its tests.

import { createHash } from 'node:crypto';

export const MODULE_SIZES = [10, 10, 10, 10, 8];
export const RESPONSE_TYPES = ['text', 'person'];
const CODE_PATTERN = /^[a-z0-9_]{1,40}$/;

// Same scheme as supabase/seed.sql (md5 of a label, formatted as uuid) so ids are stable across
// seed, import and re-imports.
export function stableId(label) {
  const hex = createHash('md5').update(`gold-roundtables:${label}`).digest('hex');
  return `${hex.slice(0, 8)}-${hex.slice(8, 12)}-${hex.slice(12, 16)}-${hex.slice(16, 20)}-${hex.slice(20)}`;
}

const isText = (v) => typeof v === 'string' && v.trim().length > 0 && !v.includes('\0');
const isOptionalText = (v) => v === undefined || v === null || (typeof v === 'string' && !v.includes('\0'));

// Returns a list of human-readable problems; empty means the file is importable.
export function validateCurriculum(data) {
  const errors = [];
  if (data === null || typeof data !== 'object' || !Array.isArray(data.modules)) {
    return ['The file must be an object with a "modules" array.'];
  }
  if (data.modules.length !== MODULE_SIZES.length) {
    errors.push(`Expected ${MODULE_SIZES.length} modules, found ${data.modules.length}.`);
  }
  let expectedValue = 1;
  data.modules.forEach((module, index) => {
    const where = `modules[${index}]`;
    if (module === null || typeof module !== 'object') {
      errors.push(`${where} must be an object.`);
      return;
    }
    if (module.number !== index + 1) errors.push(`${where}.number must be ${index + 1} (modules in order).`);
    if (!isText(module.name)) errors.push(`${where}.name is required.`);
    if (!isOptionalText(module.description)) errors.push(`${where}.description must be text.`);
    const values = Array.isArray(module.values) ? module.values : [];
    if (!Array.isArray(module.values)) errors.push(`${where}.values must be an array.`);
    const expectedSize = MODULE_SIZES[index];
    if (expectedSize !== undefined && values.length !== expectedSize) {
      errors.push(`${where} must have ${expectedSize} values, found ${values.length}.`);
    }
    values.forEach((value) => {
      const label = `${where} value #${value?.number ?? '?'}`;
      if (value === null || typeof value !== 'object') {
        errors.push(`${where} has a value that is not an object.`);
        expectedValue += 1;
        return;
      }
      if (value.number !== expectedValue) {
        errors.push(`${label}: number must be ${expectedValue} (values 1–48 in order, no gaps).`);
      }
      expectedValue += 1;
      if (!isText(value.name)) errors.push(`${label}: name is required.`);
      if (!isOptionalText(value.description)) errors.push(`${label}: description must be text.`);
      if (!isOptionalText(value.bookletReference)) errors.push(`${label}: bookletReference must be text.`);
      validateQuestions(value, label, errors);
    });
  });
  return errors;
}

function validateQuestions(value, label, errors) {
  if (!Array.isArray(value.questions) || value.questions.length === 0) {
    errors.push(`${label}: at least one question is required.`);
    return;
  }
  const codes = new Set();
  value.questions.forEach((question, i) => {
    const q = `${label} question[${i}]`;
    if (question === null || typeof question !== 'object') {
      errors.push(`${q} must be an object.`);
      return;
    }
    if (typeof question.code !== 'string' || !CODE_PATTERN.test(question.code)) {
      errors.push(`${q}: code must match ${CODE_PATTERN}.`);
    } else if (codes.has(question.code)) {
      errors.push(`${q}: duplicate code "${question.code}".`);
    } else {
      codes.add(question.code);
    }
    if (!isText(question.text)) errors.push(`${q}: text is required.`);
    if (question.responseType !== undefined && !RESPONSE_TYPES.includes(question.responseType)) {
      errors.push(`${q}: responseType must be one of ${RESPONSE_TYPES.join(', ')}.`);
    }
  });
}

const lit = (v) => (v === undefined || v === null ? 'null' : `'${String(v).replaceAll("'", "''")}'`);

// One transaction. Upserts by natural key (module number, value sequence, value+question code);
// existing ids are never rewritten. Questions that left the file are deactivated, never deleted
// (answers reference them).
export function buildImportSql(data) {
  const lines = ['begin;'];
  for (const module of data.modules) {
    const id = stableId(`module:${module.number}`);
    lines.push(
      `insert into public.curriculum_modules (id, number, name, description, value_count) values ` +
        `('${id}', ${module.number}, ${lit(module.name)}, ${lit(module.description)}, ${module.values.length}) ` +
        `on conflict (number) do update set name = excluded.name, description = excluded.description, ` +
        `value_count = excluded.value_count, status = 'active';`,
    );
    module.values.forEach((value, position) => {
      lines.push(
        `insert into public.curriculum_values (id, module_id, number_in_module, sequence, name, description, booklet_reference) ` +
          `values ('${stableId(`value:${value.number}`)}', (select id from public.curriculum_modules where number = ${module.number}), ` +
          `${position + 1}, ${value.number}, ${lit(value.name)}, ${lit(value.description)}, ${lit(value.bookletReference)}) ` +
          `on conflict (sequence) do update set module_id = excluded.module_id, number_in_module = excluded.number_in_module, ` +
          `name = excluded.name, description = excluded.description, booklet_reference = excluded.booklet_reference, status = 'active';`,
      );
      const codes = value.questions.map((q) => lit(q.code)).join(', ');
      lines.push(
        `update public.value_questions set status = 'inactive' where status = 'active' ` +
          `and value_id = (select id from public.curriculum_values where sequence = ${value.number}) and question_code not in (${codes});`,
      );
      value.questions.forEach((question, order) => {
        lines.push(
          `insert into public.value_questions (id, value_id, question_code, question_text, sort_order, response_type) ` +
            `values ('${stableId(`question:${value.number}:${question.code}`)}', (select id from public.curriculum_values where sequence = ${value.number}), ` +
            `${lit(question.code)}, ${lit(question.text)}, ${order + 1}, ${lit(question.responseType ?? 'text')}) ` +
            `on conflict (value_id, question_code) do update set question_text = excluded.question_text, ` +
            `sort_order = excluded.sort_order, response_type = excluded.response_type, status = 'active';`,
        );
      });
    });
  }
  lines.push('commit;');
  return `${lines.join('\n')}\n`;
}
