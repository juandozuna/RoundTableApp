// Notifications (ADR 0009): device-token registration for signed-in users, and dispatch /
// cron entry points that drain public.notification_outbox through the PushSender (FCM).
import { requireCaller, requireCron } from "../_shared/auth.ts";
import { callApi } from "../_shared/db.ts";
import { deliver, pushSenderFromEnv } from "../_shared/fcm.ts";
import { json, readJson, type Route, serveRoutes } from "../_shared/http.ts";
import { validate } from "../_shared/validation.ts";

async function dispatch(limit = 200) {
  const rows = await callApi<Parameters<typeof deliver>[1]>("notifications_claim", { p_limit: limit });
  if (!rows.length) return { claimed: 0, sent: 0, skipped: 0, failed: 0 };
  const sender = pushSenderFromEnv();
  const { results, invalidTokens } = await deliver(sender, rows);
  await callApi("notifications_complete", { p_results: results, p_invalid_tokens: invalidTokens });
  const count = (status: string) => results.filter((r) => r.status === status).length;
  return {
    sender: sender.name,
    claimed: rows.length,
    sent: count("sent"),
    skipped: count("skipped"),
    failed: count("failed"),
    tokens_removed: invalidTokens.length,
  };
}

const cron = (kind: "session_reminder" | "commitment_nudge" | "table_alert") => async (req: Request) => {
  requireCron(req);
  const enqueued = await callApi<{ enqueued: number }>("notifications_enqueue", { p_kind: kind });
  return json(req, { ...enqueued, dispatch: await dispatch() });
};

const routes: Route[] = [
  {
    method: "POST",
    pattern: "device-tokens",
    handler: async (req) => {
      const caller = await requireCaller(req);
      const body = await readJson(req);
      validate(body, (v) => v.text("token", { required: true, min: 10, max: 4096 })
        .oneOf("platform", ["android", "ios", "web"]));
      const token = await callApi("device_token_register", { p_uid: caller.userId, p_input: body });
      return json(req, { device_token: token }, 201);
    },
  },
  {
    method: "DELETE",
    pattern: "device-tokens",
    handler: async (req) => {
      const caller = await requireCaller(req);
      const body = await readJson(req);
      validate(body, (v) => v.text("token", { required: true, max: 4096 }));
      return json(req, await callApi("device_token_unregister", { p_uid: caller.userId, p_input: body }));
    },
  },
  {
    method: "POST",
    pattern: "dispatch",
    handler: async (req) => {
      requireCron(req);
      return json(req, await dispatch());
    },
  },
  { method: "POST", pattern: "cron/session-reminders", handler: cron("session_reminder") },
  { method: "POST", pattern: "cron/commitment-nudges", handler: cron("commitment_nudge") },
  { method: "POST", pattern: "cron/table-alerts", handler: cron("table_alert") },
];

serveRoutes("notifications", routes);
