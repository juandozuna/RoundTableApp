// Request validation (pure; no Deno/Supabase APIs) — early, friendly errors. The database
// re-checks every invariant.
import { ApiError } from "./errors.ts";

export type Json = Record<string, unknown>;
export type FieldErrors = Record<string, string>;

const UUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
const E164 = /^\+[1-9][0-9]{6,14}$/;
const EMAIL = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;
const TIME = /^([01][0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?$/;
const TABLE_CODE = /^[A-Z0-9][A-Z0-9-]{1,19}$/;
export const INVITE_CODE = /^[A-HJ-NP-Z2-9]{6}$/;

export const isUuid = (v: unknown): v is string => typeof v === "string" && UUID.test(v);

/** Score rule (PC-08, ADR 0005): integer 1–10, 5 not allowed. Returns an error code or null. */
export function scoreError(score: unknown): "score_out_of_range" | "score_five_not_allowed" | null {
  if (typeof score !== "number" || !Number.isInteger(score) || score < 1 || score > 10) {
    return "score_out_of_range";
  }
  return score === 5 ? "score_five_not_allowed" : null;
}

/** Uppercase, strip spaces and dashes ("mes a-34" → "MESA34"). */
export function normalizeInviteCode(code: unknown): string {
  return typeof code === "string" ? code.replace(/[\s-]/g, "").toUpperCase() : "";
}

export class Validator {
  readonly errors: FieldErrors = {};
  constructor(private readonly body: Json) {}

  private fail(field: string, message: string) {
    if (!(field in this.errors)) this.errors[field] = message;
  }

  private value(field: string): unknown {
    return field.split(".").reduce<unknown>(
      (acc, key) => (acc && typeof acc === "object" ? (acc as Json)[key] : undefined),
      this.body,
    );
  }

  has(field: string): boolean {
    return this.value(field) !== undefined && this.value(field) !== null;
  }

  uuid(field: string, required = true): this {
    const v = this.value(field);
    if (v === undefined || v === null) {
      if (required) this.fail(field, "Es obligatorio.");
    } else if (!isUuid(v)) this.fail(field, "Identificador no válido.");
    return this;
  }

  text(field: string, opts: { required?: boolean; min?: number; max?: number } = {}): this {
    const v = this.value(field);
    if (v === undefined || v === null || (typeof v === "string" && v.trim() === "")) {
      if (opts.required) this.fail(field, "Es obligatorio.");
      return this;
    }
    if (typeof v !== "string") return (this.fail(field, "Debe ser texto."), this);
    const length = v.trim().length;
    if (opts.min !== undefined && length < opts.min) this.fail(field, `Mínimo ${opts.min} caracteres.`);
    if (opts.max !== undefined && length > opts.max) this.fail(field, `Máximo ${opts.max} caracteres.`);
    return this;
  }

  oneOf(field: string, values: readonly string[], required = true): this {
    const v = this.value(field);
    if (v === undefined || v === null) {
      if (required) this.fail(field, "Es obligatorio.");
    } else if (typeof v !== "string" || !values.includes(v)) {
      this.fail(field, `Debe ser uno de: ${values.join(", ")}.`);
    }
    return this;
  }

  int(field: string, min: number, max: number, required = true): this {
    const v = this.value(field);
    if (v === undefined || v === null) {
      if (required) this.fail(field, "Es obligatorio.");
    } else if (typeof v !== "number" || !Number.isInteger(v) || v < min || v > max) {
      this.fail(field, `Debe ser un número entero entre ${min} y ${max}.`);
    }
    return this;
  }

  bool(field: string): this {
    const v = this.value(field);
    if (v !== undefined && v !== null && typeof v !== "boolean") this.fail(field, "Debe ser verdadero o falso.");
    return this;
  }

  email(field: string): this {
    const v = this.value(field);
    if (v !== undefined && v !== null && v !== "" && (typeof v !== "string" || !EMAIL.test(v.trim()))) {
      this.fail(field, "Correo no válido.");
    }
    return this;
  }

  /** International phone in E.164 (ADR 0007: contact data only, unverified). */
  phone(field: string): this {
    const v = this.value(field);
    if (v !== undefined && v !== null && v !== "" && (typeof v !== "string" || !E164.test(v.trim()))) {
      this.fail(field, "Teléfono no válido: usa el formato internacional, p. ej. +18095551234.");
    }
    return this;
  }

  time(field: string, required = true): this {
    const v = this.value(field);
    if (v === undefined || v === null) {
      if (required) this.fail(field, "Es obligatorio.");
    } else if (typeof v !== "string" || !TIME.test(v)) this.fail(field, "Hora no válida (HH:MM).");
    return this;
  }

  timestamp(field: string, required = false): this {
    const v = this.value(field);
    if (v === undefined || v === null) {
      if (required) this.fail(field, "Es obligatorio.");
    } else if (typeof v !== "string" || Number.isNaN(Date.parse(v))) this.fail(field, "Fecha no válida.");
    return this;
  }

  tableCode(field: string, required = true): this {
    const v = this.value(field);
    if (v === undefined || v === null) {
      if (required) this.fail(field, "Es obligatorio.");
    } else if (typeof v !== "string" || !TABLE_CODE.test(v.trim().toUpperCase())) {
      this.fail(field, "Código no válido: letras, números y guiones (2 a 20).");
    }
    return this;
  }

  inviteCode(field: string): this {
    if (!INVITE_CODE.test(normalizeInviteCode(this.value(field)))) {
      this.fail(field, "El código tiene 6 letras o números.");
    }
    return this;
  }

  /** {first_name, last_name, position?, email?, phone?} */
  personInput(field: string): this {
    return this.text(`${field}.first_name`, { required: true, max: 80 })
      .text(`${field}.last_name`, { required: true, max: 80 })
      .text(`${field}.position`, { max: 120 })
      .email(`${field}.email`)
      .phone(`${field}.phone`);
  }

  /** Either {person_id} or {person: {...}} at the given prefix ("" for the body root). */
  personRef(prefix = ""): this {
    const idField = prefix ? `${prefix}.person_id` : "person_id";
    const personField = prefix ? `${prefix}.person` : "person";
    if (this.has(idField)) return this.uuid(idField);
    if (this.has(personField)) return this.personInput(personField);
    this.fail(personField, "Elige una persona existente o registra una nueva.");
    return this;
  }

  check(condition: boolean, field: string, message: string): this {
    if (!condition) this.fail(field, message);
    return this;
  }

  throwIfInvalid(): void {
    if (Object.keys(this.errors).length) {
      throw new ApiError("validation_failed", undefined, { fields: this.errors });
    }
  }
}

export function validate(body: Json, rules: (v: Validator) => void): void {
  const v = new Validator(body);
  rules(v);
  v.throwIfInvalid();
}
