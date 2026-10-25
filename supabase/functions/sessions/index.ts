// Online facilitator controls for a session (ADR 0003): open, move stage, close answers,
// close, cancel. Offline devices send the same changes through sync-upload.
import { requireCaller } from "../_shared/auth.ts";
import { callApi } from "../_shared/db.ts";
import { ApiError } from "../_shared/errors.ts";
import { json, readJson, type Route, serveRoutes } from "../_shared/http.ts";
import { notifiesMembers, OPEN_STAGES, type SessionStage } from "../_shared/session_state.ts";
import { isUuid, validate } from "../_shared/validation.ts";
import { deliver, pushSenderFromEnv } from "../_shared/fcm.ts";

interface SessionRow {
  id: string;
  status: string;
  stage: SessionStage;
  stage_changed: boolean;
  [key: string]: unknown;
}

async function change(req: Request, sessionId: string, changes: Record<string, unknown>) {
  if (!isUuid(sessionId)) throw new ApiError("validation_failed", "Identificador de sesión no válido.");
  const caller = await requireCaller(req);
  const session = await callApi<SessionRow>("session_change", {
    p_uid: caller.userId,
    p_session_id: sessionId,
    p_changes: changes,
  });
  if (session.stage_changed && session.status === "open" && notifiesMembers(session.stage)) {
    await notifyStageOpened(session.id);
  }
  return json(req, { session });
}

// Best effort: a push failure never fails the facilitator's action.
async function notifyStageOpened(sessionId: string) {
  try {
    await callApi("notifications_enqueue", { p_kind: "stage_opened", p_session_id: sessionId });
    const rows = await callApi<Parameters<typeof deliver>[1]>("notifications_claim", { p_limit: 50 });
    if (!rows.length) return;
    const { results, invalidTokens } = await deliver(pushSenderFromEnv(), rows);
    await callApi("notifications_complete", { p_results: results, p_invalid_tokens: invalidTokens });
  } catch (error) {
    console.warn("[sessions] stage notification failed", error);
  }
}

const routes: Route[] = [
  {
    method: "POST",
    pattern: ":id/open",
    handler: async (req, { id }) => {
      const body = await readJson(req);
      validate(body, (v) => v.oneOf("stage", ["lobby", "attendance"], false).timestamp("started_at"));
      return change(req, id, {
        status: "open",
        stage: body.stage ?? "lobby",
        started_at: body.started_at,
        device_modified_at: body.device_modified_at,
      });
    },
  },
  {
    method: "POST",
    pattern: ":id/stage",
    handler: async (req, { id }) => {
      const body = await readJson(req);
      validate(body, (v) => v.oneOf("stage", OPEN_STAGES));
      return change(req, id, { stage: body.stage, device_modified_at: body.device_modified_at });
    },
  },
  {
    method: "POST",
    pattern: ":id/close-answers",
    handler: async (req, { id }) => {
      const body = await readJson(req);
      validate(body, (v) => v.timestamp("answers_closed_at"));
      return change(req, id, { answers_closed_at: body.answers_closed_at ?? new Date().toISOString() });
    },
  },
  {
    method: "POST",
    pattern: ":id/close",
    handler: async (req, { id }) => {
      const body = await readJson(req);
      validate(body, (v) => v.timestamp("ended_at"));
      return change(req, id, { status: "closed", ended_at: body.ended_at });
    },
  },
  {
    method: "POST",
    pattern: ":id/cancel",
    handler: async (req, { id }) => {
      const body = await readJson(req);
      validate(body, (v) => v.text("reason", { max: 300 }));
      return change(req, id, { status: "cancelled", cancelled_reason: body.reason ?? null });
    },
  },
];

serveRoutes("sessions", routes);
