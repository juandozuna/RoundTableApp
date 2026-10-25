// Late-sync decision (ADR 0005) — mirror of app.session_row_prepare (SQL is authoritative).
// Clients can use the same rule to label rows "Sincronizado tarde" before the server confirms.

export const LATE_GRACE_MS = 15 * 60 * 1000;

export interface LateSyncInput {
  sessionStatus: "scheduled" | "open" | "closed" | "cancelled";
  sessionEndedAt: Date | null;
  /** Device time the row was captured or last edited (device_modified_at ?? device_created_at). */
  deviceAt: Date;
  /** Server time the upload is applied. */
  receivedAt: Date;
  /** Whether the row was already flagged on a previous upload. */
  previouslyLate?: boolean;
}

export type LateSyncDecision =
  | { accept: true; syncedLate: boolean; deviceAt: Date }
  | { accept: false; code: "session_cancelled" | "session_closed" };

export function decideLateSync(input: LateSyncInput): LateSyncDecision {
  // Device clocks are never allowed in the future.
  const deviceAt = input.deviceAt > input.receivedAt ? input.receivedAt : input.deviceAt;
  if (input.sessionStatus === "cancelled") return { accept: false, code: "session_cancelled" };
  if (input.sessionStatus === "closed") {
    const endedAt = input.sessionEndedAt ?? input.receivedAt;
    if (deviceAt.getTime() > endedAt.getTime() + LATE_GRACE_MS) {
      return { accept: false, code: "session_closed" };
    }
    return { accept: true, syncedLate: true, deviceAt };
  }
  return { accept: true, syncedLate: input.previouslyLate ?? false, deviceAt };
}

/** When a close arrives after rows were uploaded: rows received after the close are late. */
export function lateAfterClose(receivedAt: Date, sessionEndedAt: Date): boolean {
  return receivedAt.getTime() > sessionEndedAt.getTime();
}
