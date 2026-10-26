import { createClient, type SupabaseClient } from "npm:@supabase/supabase-js@2.45.4";
import { clientAddressFrom } from "./client_address.ts";
import { ApiError, fromPostgrestError } from "./errors.ts";

let serviceClient: SupabaseClient | null = null;

/** Service-role client. Used only to call api.* functions and to verify user tokens. */
export function service(): SupabaseClient {
  if (serviceClient) return serviceClient;
  const url = Deno.env.get("SUPABASE_URL");
  const key = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!url || !key) throw new ApiError("internal_error", undefined, { reason: "missing Supabase env" });
  serviceClient = createClient(url, key, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  return serviceClient;
}

/** Calls api.<fn>(args) in one database transaction; maps errors to ApiError codes. */
export async function callApi<T = unknown>(fn: string, args: Record<string, unknown>): Promise<T> {
  const { data, error } = await service().schema("api").rpc(fn, args);
  if (error) throw fromPostgrestError(error);
  return data as T;
}

/** Address bucket for rate limits; see client_address.ts for the trust order. */
export const clientAddress = (req: Request): string => clientAddressFrom(req.headers);

/**
 * Counts one hit against `bucket` and throws ApiError("rate_limited") (HTTP 429, Retry-After)
 * once more than `max` hits landed in the current `windowSeconds` window.
 */
export async function enforceRateLimit(bucket: string, max: number, windowSeconds: number): Promise<void> {
  const result = await callApi<{ allowed: boolean; retry_after_seconds: number }>("rate_limit_hit", {
    p_bucket: bucket,
    p_max: max,
    p_window_seconds: windowSeconds,
  });
  if (!result.allowed) {
    throw new ApiError("rate_limited", undefined, { retry_after_seconds: result.retry_after_seconds });
  }
}
