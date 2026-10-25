// Invites (ADR 0007): create, list, revoke, renew, anonymous preview, redeem.
import { requireCaller } from "../_shared/auth.ts";
import { callApi } from "../_shared/db.ts";
import { ApiError } from "../_shared/errors.ts";
import { json, readJson, type Route, serveRoutes } from "../_shared/http.ts";
import { isUuid, normalizeInviteCode, validate } from "../_shared/validation.ts";

const appUrl = () => (Deno.env.get("APP_PUBLIC_URL") ?? "http://127.0.0.1:3000").replace(/\/+$/, "");

type Invite = Record<string, unknown> & { code: string };
const withLink = (invite: Invite) => ({
  ...invite,
  invite_url: `${appUrl()}/invite/${invite.code}`,
});

const routes: Route[] = [
  {
    method: "POST",
    pattern: "",
    handler: async (req) => {
      const caller = await requireCaller(req);
      const body = await readJson(req);
      validate(body, (v) => {
        v.oneOf("role_kind", ["coordinator", "facilitator", "member"]);
        if (body.role_kind === "coordinator") v.uuid("organization_id");
        else v.uuid("round_table_id");
        v.personRef();
        v.int("expires_in_days", 1, 60, false);
      });
      const invite = await callApi<Invite>("invite_create", { p_uid: caller.userId, p_input: body });
      return json(req, { invite: withLink(invite) }, 201);
    },
  },
  {
    method: "GET",
    pattern: "",
    handler: async (req, _params, url) => {
      const caller = await requireCaller(req);
      const input = {
        organization_id: url.searchParams.get("organization_id") ?? undefined,
        round_table_id: url.searchParams.get("round_table_id") ?? undefined,
        status: url.searchParams.get("status") ?? undefined,
      };
      validate(input, (v) =>
        v.uuid("organization_id", false).uuid("round_table_id", false)
          .oneOf("status", ["pending", "accepted", "expired", "revoked"], false)
      );
      const invites = await callApi<Invite[]>("invite_list", { p_uid: caller.userId, p_input: input });
      return json(req, { invites: invites.map(withLink) });
    },
  },
  {
    // Anonymous-safe: no Authorization required; returns only the welcome-card fields.
    method: "GET",
    pattern: "preview",
    handler: async (req, _params, url) => {
      const code = normalizeInviteCode(url.searchParams.get("code"));
      validate({ code }, (v) => v.inviteCode("code"));
      return json(req, { invite: await callApi("invite_preview", { p_code: code }) });
    },
  },
  {
    method: "POST",
    pattern: "redeem",
    handler: async (req) => {
      const caller = await requireCaller(req);
      const body = await readJson(req);
      validate(body, (v) => {
        v.inviteCode("code");
        if (v.has("profile")) {
          v.text("profile.first_name", { max: 80 }).text("profile.last_name", { max: 80 })
            .text("profile.position", { max: 120 }).phone("profile.phone");
        }
      });
      const result = await callApi("invite_redeem", {
        p_uid: caller.userId,
        p_email: caller.email,
        p_input: { ...body, code: normalizeInviteCode(body.code) },
      });
      return json(req, result);
    },
  },
  {
    method: "POST",
    pattern: ":id/revoke",
    handler: async (req, { id }) => {
      if (!isUuid(id)) throw new ApiError("validation_failed");
      const caller = await requireCaller(req);
      const invite = await callApi<Invite>("invite_revoke", { p_uid: caller.userId, p_input: { invite_id: id } });
      return json(req, { invite: withLink(invite) });
    },
  },
  {
    method: "POST",
    pattern: ":id/renew",
    handler: async (req, { id }) => {
      if (!isUuid(id)) throw new ApiError("validation_failed");
      const caller = await requireCaller(req);
      const body = await readJson(req);
      validate(body, (v) => v.int("expires_in_days", 1, 60, false));
      const invite = await callApi<Invite>("invite_renew", {
        p_uid: caller.userId,
        p_input: { ...body, invite_id: id },
      });
      return json(req, { invite: withLink(invite) });
    },
  },
];

serveRoutes("invites", routes);
