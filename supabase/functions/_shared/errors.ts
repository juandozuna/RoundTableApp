// Stable English error codes with Spanish user-facing messages. The database raises the same
// codes (app.fail) with its own Spanish detail, which takes precedence when present.

export type ErrorCode = keyof typeof ERRORS;

export const ERRORS = {
  unauthenticated: [401, "Inicia sesión para continuar."],
  forbidden: [403, "No tienes permiso para hacer esto."],
  not_found: [404, "No encontramos lo que buscas."],
  route_not_found: [404, "Esta ruta no existe."],
  method_not_allowed: [405, "Método no permitido."],
  rate_limited: [429, "Demasiados intentos. Espera un momento e inténtalo de nuevo."],
  validation_failed: [422, "Revisa los datos e inténtalo de nuevo."],
  invalid_json: [400, "El cuerpo de la solicitud no es JSON válido."],
  invalid_reference: [422, "Uno de los datos hace referencia a algo que no existe."],
  immutable_field: [422, "Ese dato no se puede cambiar."],
  invalid_timezone: [422, "La zona horaria no es válida."],
  unsupported_table: [422, "Esta tabla no se sincroniza desde el dispositivo."],
  operation_not_allowed: [409, "Esta operación no está permitida."],
  score_out_of_range: [422, "El puntaje debe ser un número entero del 1 al 10."],
  score_five_not_allowed: [422, "El 5 no está permitido: elige si estás más cerca del 4 o del 6."],
  question_mismatch: [422, "La pregunta no corresponde al valor de esta sesión."],
  follow_up_not_available: [422, "Esta sesión no tiene seguimiento."],
  follow_up_session_mismatch: [422, "El seguimiento se registra en la sesión siguiente de la misma mesa."],
  follow_up_already_recorded: [409, "El seguimiento de este compromiso ya se registró."],
  facilitator_required: [422, "Asigna un facilitador a la mesa."],
  table_full: [409, "La mesa ya tiene 9 personas (incluido el facilitador)."],
  table_has_facilitator: [409, "La mesa ya tiene facilitador."],
  table_not_active: [409, "La mesa está cerrada o completó el programa."],
  already_member: [409, "La persona ya está en esta mesa."],
  membership_inactive: [409, "Esta membresía ya terminó."],
  cannot_move_facilitator: [409, "Primero asigna otro facilitador a la mesa."],
  cannot_remove_facilitator: [409, "Para retirar al facilitador, asigna primero uno nuevo."],
  person_inactive: [409, "La persona está desactivada."],
  person_already_linked: [409, "Esta persona ya tiene una cuenta vinculada."],
  duplicate_id: [409, "Ese registro ya existe."],
  duplicate_assessment: [409, "Ya registraste tu puntaje para este valor."],
  duplicate_follow_up: [409, "El seguimiento de este valor ya se registró. Solo se hace una vez."],
  duplicate_answer: [409, "Ya respondiste esta pregunta."],
  duplicate_commitment: [409, "Ya registraste tu compromiso para esta sesión."],
  duplicate_attendance: [409, "La asistencia de esta persona ya se registró."],
  duplicate_table_code: [409, "Ya existe una mesa con ese código en la organización."],
  duplicate_organization: [409, "Ya existe una organización con ese nombre."],
  duplicate_location: [409, "Ya existe una ubicación con ese nombre."],
  duplicate_token: [409, "Ese dispositivo ya está registrado."],
  conflict: [409, "Ese cambio entra en conflicto con datos existentes."],
  session_not_found: [404, "La sesión no existe."],
  session_closed: [409, "La sesión ya se cerró."],
  session_cancelled: [409, "La sesión fue cancelada."],
  session_finalized: [409, "La sesión ya está cerrada y no se puede modificar."],
  session_pending_exists: [409, "La mesa ya tiene una sesión pendiente."],
  invalid_session_transition: [409, "Ese cambio de etapa no está permitido para esta sesión."],
  not_table_participant: [403, "La persona no participa en esta mesa."],
  value_change_blocked: [409, "La sesión pendiente ya tiene respuestas."],
  organization_inactive: [409, "La organización está pausada o desactivada."],
  last_platform_admin: [409, "Debe quedar al menos un administrador de plataforma."],
  invite_not_found: [404, "No encontramos ese código. Revisa las letras y números."],
  invite_expired: [410, "Esta invitación venció. Pide una nueva a quien te invitó."],
  invite_revoked: [410, "Esta invitación fue anulada. Pide una nueva a quien te invitó."],
  invite_already_used: [409, "Esta invitación ya se usó."],
  invite_pending_exists: [409, "Ya hay una invitación pendiente para esta persona."],
  person_linked_elsewhere: [409, "Esta invitación ya está vinculada a otra cuenta."],
  identity_linked_elsewhere: [409, "Tu cuenta ya está vinculada a otra persona de esta organización."],
  no_person: [409, "Tu cuenta todavía no está vinculada a ninguna invitación."],
  internal_error: [500, "Ocurrió un error inesperado. Inténtalo de nuevo."],
} as const satisfies Record<string, readonly [number, string]>;

export class ApiError extends Error {
  constructor(
    readonly code: string,
    readonly detail?: string,
    readonly extra?: Record<string, unknown>,
  ) {
    super(code);
  }

  get status(): number {
    return (ERRORS as Record<string, readonly [number, string]>)[this.code]?.[0] ?? 400;
  }

  get userMessage(): string {
    return this.detail ||
      ((ERRORS as Record<string, readonly [number, string]>)[this.code]?.[1] ??
        ERRORS.internal_error[1]);
  }
}

export function messageFor(code: string): string {
  return (ERRORS as Record<string, readonly [number, string]>)[code]?.[1] ??
    ERRORS.internal_error[1];
}

// Unique-constraint names → API codes (mirror of app.error_code in SQL).
const UNIQUE_CONSTRAINTS: Record<string, string> = {
  member_assessments_session_person_kind_key: "duplicate_assessment",
  member_answers_session_person_question_key: "duplicate_answer",
  member_commitments_session_person_key: "duplicate_commitment",
  session_attendance_session_id_person_id_key: "duplicate_attendance",
  table_members_active_person_key: "already_member",
  table_members_active_facilitator_key: "table_has_facilitator",
  round_tables_org_code_key: "duplicate_table_code",
  organizations_name_key: "duplicate_organization",
  locations_org_name_key: "duplicate_location",
  people_auth_user_per_org_key: "identity_linked_elsewhere",
  sessions_one_pending_key: "session_pending_exists",
  device_tokens_token_key: "duplicate_token",
};

export interface PostgrestLikeError {
  code?: string;
  message?: string;
  details?: string | null;
  hint?: string | null;
}

/** Maps a PostgREST/Postgres error into an ApiError with a stable code. */
export function fromPostgrestError(error: PostgrestLikeError): ApiError {
  const sqlState = error.code ?? "";
  const message = error.message ?? "";
  if (sqlState === "P0001") {
    return new ApiError(message in ERRORS ? message : message || "internal_error", error.details ?? undefined);
  }
  if (sqlState === "23505") {
    const constraint = /constraint "([^"]+)"/.exec(message)?.[1] ?? "";
    if (constraint.endsWith("_pkey")) return new ApiError("duplicate_id");
    return new ApiError(UNIQUE_CONSTRAINTS[constraint] ?? "conflict");
  }
  if (sqlState === "23514") {
    return new ApiError(
      message.includes("member_assessments_score_check") ? "score_out_of_range" : "validation_failed",
    );
  }
  if (sqlState === "23503") return new ApiError("invalid_reference");
  if (["23502", "22P02", "22007", "22008", "22003", "22001", "22023"].includes(sqlState)) {
    return new ApiError("validation_failed", undefined, { reason: message });
  }
  if (sqlState === "42501") return new ApiError("forbidden");
  return new ApiError("internal_error", undefined, { reason: `${sqlState} ${message}`.trim() });
}
