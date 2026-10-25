import { corsHeaders, preflight } from "./cors.ts";
import { ApiError } from "./errors.ts";

export function json(req: Request, body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders(req), "Content-Type": "application/json; charset=utf-8" },
  });
}

export function errorResponse(req: Request, error: unknown): Response {
  if (error instanceof ApiError) {
    if (error.status >= 500) console.error(`[${error.code}]`, error.extra ?? "");
    return json(req, {
      error: { code: error.code, message: error.userMessage, ...(error.extra ?? {}) },
    }, error.status);
  }
  console.error("unhandled error", error);
  const internal = new ApiError("internal_error");
  return json(req, { error: { code: internal.code, message: internal.userMessage } }, 500);
}

export async function readJson<T = Record<string, unknown>>(req: Request): Promise<T> {
  const text = await req.text();
  if (!text.trim()) return {} as T;
  try {
    const parsed = JSON.parse(text);
    if (parsed === null || typeof parsed !== "object" || Array.isArray(parsed)) {
      throw new ApiError("invalid_json");
    }
    return parsed as T;
  } catch (error) {
    if (error instanceof ApiError) throw error;
    throw new ApiError("invalid_json");
  }
}

export type Params = Record<string, string>;
export type Handler = (req: Request, params: Params, url: URL) => Promise<Response>;
export interface Route {
  method: string;
  pattern: string; // e.g. "tables/:id/facilitator" (relative to the function name)
  handler: Handler;
}

/** Path segments after the function name: /functions/v1/admin/tables/1 → ["tables", "1"]. */
export function routeSegments(pathname: string, functionName: string): string[] {
  const segments = pathname.split("/").filter(Boolean);
  const index = segments.indexOf(functionName);
  return index >= 0 ? segments.slice(index + 1) : segments;
}

export function matchRoute(
  routes: Route[],
  method: string,
  segments: string[],
): { route: Route; params: Params } | { allowed: string[] } | null {
  const allowed: string[] = [];
  for (const route of routes) {
    const parts = route.pattern.split("/").filter(Boolean);
    if (parts.length !== segments.length) continue;
    const params: Params = {};
    const matches = parts.every((part, i) => {
      if (part.startsWith(":")) {
        params[part.slice(1)] = decodeURIComponent(segments[i]);
        return true;
      }
      return part === segments[i];
    });
    if (!matches) continue;
    if (route.method === method) return { route, params };
    allowed.push(route.method);
  }
  return allowed.length ? { allowed } : null;
}

/** Standard entry point: CORS preflight, routing, uniform error envelope. */
export function serveRoutes(functionName: string, routes: Route[]): void {
  Deno.serve(async (req) => {
    const pre = preflight(req);
    if (pre) return pre;
    try {
      const url = new URL(req.url);
      const found = matchRoute(routes, req.method, routeSegments(url.pathname, functionName));
      if (!found) throw new ApiError("route_not_found");
      if ("allowed" in found) throw new ApiError("method_not_allowed", undefined, { allowed: found.allowed });
      return await found.route.handler(req, found.params, url);
    } catch (error) {
      return errorResponse(req, error);
    }
  });
}
