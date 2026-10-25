// Session state machine — mirror of app.session_transition_error (SQL is authoritative).
//
//   scheduled ──open──▶ open (lobby | attendance | follow_up | value | commitment)
//       │                 │  stages may move in either direction while open
//       │                 └──close──▶ closed   [terminal]
//       ├──close──▶ closed (offline facilitator: open + close arrive together)
//       └──cancel─▶ cancelled                 [terminal]

export const SESSION_STATUSES = ["scheduled", "open", "closed", "cancelled"] as const;
export const SESSION_STAGES = ["lobby", "attendance", "follow_up", "value", "commitment", "closed"] as const;
export const OPEN_STAGES = ["lobby", "attendance", "follow_up", "value", "commitment"] as const;

export type SessionStatus = (typeof SESSION_STATUSES)[number];
export type SessionStage = (typeof SESSION_STAGES)[number];

export interface SessionState {
  status: SessionStatus;
  stage: SessionStage;
}

/** Applies the same normalization as the database: closed status ⇔ closed stage; a scheduled
 * session moved past the lobby opens. */
export function normalizeTarget(current: SessionState, requested: Partial<SessionState>): SessionState {
  let status = requested.status ?? current.status;
  let stage = requested.stage ?? current.stage;
  if (current.status === "scheduled" && status === "scheduled" && stage !== "lobby") {
    status = stage === "closed" ? "closed" : "open";
  }
  if (status === "closed" || stage === "closed") {
    status = "closed";
    stage = "closed";
  }
  return { status, stage };
}

export type TransitionError = "session_finalized" | "invalid_session_transition";

export function transitionError(from: SessionState, to: SessionState): TransitionError | null {
  if (from.status === to.status && from.stage === to.stage) return null;
  if (from.status === "closed" || from.status === "cancelled") return "session_finalized";
  switch (to.status) {
    case "scheduled":
      return from.status === "scheduled" && to.stage === "lobby" ? null : "invalid_session_transition";
    case "open":
      return to.stage !== "closed" ? null : "invalid_session_transition";
    case "closed":
      return to.stage === "closed" ? null : "invalid_session_transition";
    case "cancelled":
      return from.status === "scheduled" ? null : "invalid_session_transition";
  }
}

/** Stages that notify members when opened online (ADR 0009 #4). */
export function notifiesMembers(stage: SessionStage): boolean {
  return stage === "attendance" || stage === "follow_up" || stage === "value" || stage === "commitment";
}
