-- Server-side rate limiting of anonymous endpoints (api.rate_limit_hit).
begin;
create extension if not exists pgtap with schema extensions;
select plan(7);

select is((api.rate_limit_hit('test:a', 2, 60))->>'allowed', 'true', 'first hit is allowed');
select is((api.rate_limit_hit('test:a', 2, 60))->>'allowed', 'true', 'hit up to the allowance is allowed');
select is((api.rate_limit_hit('test:a', 2, 60))->>'allowed', 'false', 'hit beyond the allowance is refused');
select ok(
  (select (r->>'retry_after_seconds')::int between 1 and 60 from (select api.rate_limit_hit('test:a', 2, 60) as r offset 0) q),
  'a refusal says how long to wait (within the window)');
select is((api.rate_limit_hit('test:b', 2, 60))->>'allowed', 'true', 'other buckets are independent');
select is(
  (select hits from app.rate_limit_hits where bucket = 'test:a'), 4,
  'refused hits are still counted (the counter survives the refusal)');
select ok(
  not has_function_privilege('anon', 'api.rate_limit_hit(text, integer, integer)', 'execute')
  and not has_function_privilege('authenticated', 'api.rate_limit_hit(text, integer, integer)', 'execute')
  and has_function_privilege('service_role', 'api.rate_limit_hit(text, integer, integer)', 'execute'),
  'only the service role can call it');

select * from finish();
rollback;
