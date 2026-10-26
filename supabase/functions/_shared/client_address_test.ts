import { assertEquals } from "jsr:@std/assert@1";
import { clientAddressFrom } from "./client_address.ts";

const from = (headers: Record<string, string>) => clientAddressFrom(new Headers(headers));

Deno.test("the CDN header wins over anything the client can append", () => {
  assertEquals(from({ "cf-connecting-ip": "203.0.113.7", "x-forwarded-for": "1.1.1.1, 10.0.0.1" }), "203.0.113.7");
  assertEquals(from({ "x-real-ip": "198.51.100.4", "x-forwarded-for": "1.1.1.1" }), "198.51.100.4");
});

Deno.test("a spoofed first x-forwarded-for entry does not choose the bucket", () => {
  assertEquals(from({ "x-forwarded-for": "9.9.9.9, 192.0.2.10" }), "192.0.2.10");
  assertEquals(from({ "x-forwarded-for": "8.8.8.8, 9.9.9.9, 192.0.2.10" }), "192.0.2.10");
  assertEquals(from({ "x-forwarded-for": "192.0.2.10" }), "192.0.2.10");
});

Deno.test("without proxy headers all callers share one bucket", () => {
  assertEquals(from({}), "unknown");
});
