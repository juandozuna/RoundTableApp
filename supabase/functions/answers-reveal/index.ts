// POST /functions/v1/answers-reveal — logged access to individual answers (ADR 0015, PC-10).
// Coordinators and platform admins have no direct RLS read on free-text answers; every reveal
// writes an `answers.revealed` audit event.
import { requireCaller } from "../_shared/auth.ts";
import { callApi } from "../_shared/db.ts";
import { json, readJson, serveRoutes } from "../_shared/http.ts";
import { validate } from "../_shared/validation.ts";

serveRoutes("answers-reveal", [{
  method: "POST",
  pattern: "",
  handler: async (req) => {
    const caller = await requireCaller(req);
    const body = await readJson(req);
    validate(body, (v) =>
      v.uuid("round_table_id").uuid("session_id", false).uuid("person_id", false).uuid("value_id", false)
    );
    return json(req, await callApi("answers_reveal", { p_uid: caller.userId, p_input: body }));
  },
}]);
