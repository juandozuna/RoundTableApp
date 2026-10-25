// Administration (online-only, ADR 0003): organizations, coordinators, locations, tables,
// facilitators, memberships, people, roles, own profile. Every write is audit-logged in SQL.
import { requireCaller } from "../_shared/auth.ts";
import { callApi } from "../_shared/db.ts";
import { ApiError } from "../_shared/errors.ts";
import { json, type Params, readJson, type Route, serveRoutes } from "../_shared/http.ts";
import { isUuid, type Json, validate, type Validator } from "../_shared/validation.ts";

const ORG_KINDS = ["foundation", "school", "company", "church", "community", "other"];
const appUrl = () => (Deno.env.get("APP_PUBLIC_URL") ?? "http://127.0.0.1:3000").replace(/\/+$/, "");

/** Builds a handler: auth → body → validation → api.<fn>(p_uid, p_input). */
function op(
  fn: string,
  opts: {
    rules?: (v: Validator, body: Json) => void;
    input?: (body: Json, params: Params) => Json;
    status?: number;
    wrap?: string;
  } = {},
) {
  return async (req: Request, params: Params) => {
    for (const value of Object.values(params)) {
      if (!isUuid(value)) throw new ApiError("validation_failed", "Identificador no válido.");
    }
    const caller = await requireCaller(req);
    const body = req.method === "GET" ? {} : await readJson(req);
    if (opts.rules) validate(body, (v) => opts.rules!(v, body));
    const input = opts.input ? opts.input(body, params) : body;
    const result = await callApi<Json>(fn, { p_uid: caller.userId, p_input: input });
    return json(req, opts.wrap ? { [opts.wrap]: result } : result, opts.status ?? 200);
  };
}

const orgRules = (required: boolean) => (v: Validator) =>
  v.text("name", { required, min: 2, max: 120 })
    .oneOf("kind", ORG_KINDS, false)
    .text("country_code", { required, min: 2, max: 2 })
    .text("country_name", { required, max: 80 })
    .text("region", { max: 120 }).text("contact_name", { max: 120 })
    .email("contact_email").phone("contact_phone");

const tableRules = (required: boolean) => (v: Validator) =>
  v.uuid("location_id", required).text("name", { required, min: 2, max: 120 })
    .tableCode("code", required).int("weekday", 1, 7, required).time("start_time", required)
    .text("timezone", { required, max: 64 }).int("duration_minutes", 10, 120, false)
    .uuid("current_value_id", false)
    .oneOf("status", ["active", "paused", "completed", "closed"], false);

const routes: Route[] = [
  // ── Own profile and contexts ──
  {
    method: "GET",
    pattern: "me",
    handler: async (req) => {
      const caller = await requireCaller(req);
      return json(req, await callApi("me", { p_uid: caller.userId }));
    },
  },
  {
    method: "PATCH",
    pattern: "me",
    handler: op("profile_update", {
      rules: (v) =>
        v.text("first_name", { max: 80 }).text("last_name", { max: 80 })
          .text("position", { max: 120 }).phone("phone"),
    }),
  },

  // ── Organizations (platform admin) ──
  {
    method: "POST",
    pattern: "organizations",
    handler: op("organization_create", { rules: orgRules(true), status: 201, wrap: "organization" }),
  },
  {
    method: "PATCH",
    pattern: "organizations/:id",
    handler: op("organization_update", {
      rules: (v) =>
        v.text("name", { min: 2, max: 120 }).oneOf("kind", ORG_KINDS, false)
          .text("country_code", { min: 2, max: 2 }).text("country_name", { max: 80 })
          .text("region", { max: 120 }).text("contact_name", { max: 120 })
          .email("contact_email").phone("contact_phone"),
      input: (body, { id }) => ({ ...body, organization_id: id }),
      wrap: "organization",
    }),
  },
  {
    method: "POST",
    pattern: "organizations/:id/status",
    handler: op("organization_set_status", {
      rules: (v) => v.oneOf("status", ["active", "paused", "inactive"]),
      input: (body, { id }) => ({ status: body.status, organization_id: id }),
      wrap: "organization",
    }),
  },
  {
    // First (or additional) coordinator of an organization, created through an invite.
    method: "POST",
    pattern: "organizations/:id/coordinators",
    handler: async (req, params) => {
      const handler = op("invite_create", {
        rules: (v) => v.personRef(),
        input: (body, { id }) => ({ ...body, role_kind: "coordinator", organization_id: id }),
        status: 201,
      });
      const response = await handler(req, params);
      if (response.status !== 201) return response;
      const invite = await response.json();
      return json(req, { invite: { ...invite, invite_url: `${appUrl()}/invite/${invite.code}` } }, 201);
    },
  },

  // ── Locations ──
  {
    method: "POST",
    pattern: "locations",
    handler: op("location_create", {
      rules: (v) =>
        v.uuid("organization_id").text("name", { required: true, min: 2, max: 120 })
          .text("city", { max: 120 }).text("region", { max: 120 }).text("address", { max: 300 }),
      status: 201,
      wrap: "location",
    }),
  },
  {
    method: "PATCH",
    pattern: "locations/:id",
    handler: op("location_update", {
      rules: (v) =>
        v.text("name", { min: 2, max: 120 }).text("city", { max: 120 }).text("region", { max: 120 })
          .text("address", { max: 300 }).oneOf("status", ["active", "inactive"], false),
      input: (body, { id }) => ({ ...body, location_id: id }),
      wrap: "location",
    }),
  },

  // ── Tables ──
  {
    method: "POST",
    pattern: "tables",
    handler: op("table_create", {
      rules: (v, body) => {
        v.uuid("organization_id");
        tableRules(true)(v);
        v.uuid("start_value_id", false).timestamp("first_session_after");
        if (!body.facilitator) v.check(false, "facilitator", "Asigna un facilitador a la mesa.");
        else v.personRef("facilitator");
      },
      input: (body) => ({ ...body, code: String(body.code ?? "").trim().toUpperCase() }),
      status: 201,
      wrap: "table",
    }),
  },
  {
    method: "PATCH",
    pattern: "tables/:id",
    handler: op("table_update", {
      rules: tableRules(false),
      input: (body, { id }) => ({
        ...body,
        ...(body.code ? { code: String(body.code).trim().toUpperCase() } : {}),
        round_table_id: id,
      }),
      wrap: "table",
    }),
  },
  {
    method: "POST",
    pattern: "tables/:id/facilitator",
    handler: op("table_set_facilitator", {
      rules: (v) => v.personRef().bool("keep_previous_as_member"),
      input: (body, { id }) => ({ ...body, round_table_id: id }),
      wrap: "table",
    }),
  },
  {
    method: "POST",
    pattern: "tables/:id/members",
    handler: op("member_add", {
      rules: (v) => v.uuid("person_id"),
      input: (body, { id }) => ({ person_id: body.person_id, round_table_id: id }),
      status: 201,
      wrap: "member",
    }),
  },

  // ── Memberships ──
  {
    method: "POST",
    pattern: "members/:id/move",
    handler: op("member_move", {
      rules: (v) => v.uuid("to_round_table_id"),
      input: (body, { id }) => ({ to_round_table_id: body.to_round_table_id, table_member_id: id }),
      wrap: "member",
    }),
  },
  {
    method: "POST",
    pattern: "members/:id/deactivate",
    handler: op("member_deactivate", {
      input: (_body, { id }) => ({ table_member_id: id }),
      wrap: "member",
    }),
  },

  // ── People and roles ──
  {
    method: "PATCH",
    pattern: "people/:id",
    handler: op("person_update", {
      rules: (v) =>
        v.text("first_name", { max: 80 }).text("last_name", { max: 80 }).text("position", { max: 120 })
          .email("email").phone("phone").oneOf("status", ["active", "inactive"], false),
      input: (body, { id }) => ({ ...body, person_id: id }),
      wrap: "person",
    }),
  },
  {
    method: "POST",
    pattern: "roles",
    handler: op("role_grant", {
      rules: (v) => v.uuid("person_id").oneOf("role", ["coordinator", "platform_admin"]).uuid("location_id", false),
      status: 201,
      wrap: "role_assignment",
    }),
  },
  {
    method: "POST",
    pattern: "roles/:id/revoke",
    handler: op("role_revoke", {
      input: (_body, { id }) => ({ role_assignment_id: id }),
      wrap: "role_assignment",
    }),
  },
];

serveRoutes("admin", routes);
