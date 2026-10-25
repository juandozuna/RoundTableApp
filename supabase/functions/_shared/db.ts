import { createClient, type SupabaseClient } from "npm:@supabase/supabase-js@2.45.4";
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
