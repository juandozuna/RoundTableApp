// Handler builder shared by the admin routes: auth → body → validation → api.<fn>(p_uid, p_input).
import { requireCaller } from "./auth.ts";
import { callApi } from "./db.ts";
import { ApiError } from "./errors.ts";
import { json, type Params, readJson } from "./http.ts";
import { isUuid, type Json, validate, type Validator } from "./validation.ts";

export function op(
  fn: string,
  opts: {
    rules?: (v: Validator, body: Json) => void;
    input?: (body: Json, params: Params, url: URL) => Json;
    status?: number;
    wrap?: string;
    /** Path parameters that are not UUIDs (e.g. a locale code). */
    textParams?: string[];
  } = {},
) {
  return async (req: Request, params: Params, url: URL = new URL(req.url)) => {
    for (const [name, value] of Object.entries(params)) {
      if (!opts.textParams?.includes(name) && !isUuid(value)) {
        throw new ApiError("validation_failed", "Identificador no válido.");
      }
    }
    const caller = await requireCaller(req);
    const body = req.method === "GET" ? {} : await readJson(req);
    if (opts.rules) validate(body, (v) => opts.rules!(v, body));
    const input = opts.input ? opts.input(body, params, url) : body;
    const result = await callApi<Json>(fn, { p_uid: caller.userId, p_input: input });
    return json(req, opts.wrap ? { [opts.wrap]: result } : result, opts.status ?? 200);
  };
}
