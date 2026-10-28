// Scenario — table health alerts (RF-25, RF-67, issue #8): reason chips in the Explorador and the
// table detail, the "Menos de 3 personas" saved view, the coordinator's alerts card on Home and
// the deduplicated table_alert notifications in the outbox (no FCM → skipped by the dispatcher).
import { App, check } from '../lib.mjs';
import { refreshKpis, resetDemoSession, sql } from '../flows.mjs';

const TABLE_ALERTS = "select count(*) from notification_outbox where kind = 'table_alert'";

export async function health(browser) {
  resetDemoSession();
  refreshKpis();
  // Mesa Nueva 07 (LUZ-07) is seeded with a single person; every other Luz table has 5+ people.
  check('server: LUZ-07 is flagged few_people', sql("select health_reasons::text from (select set_config('request.jwt.claims', json_build_object('sub', md5('gold-roundtables:user:admin')::uuid, 'role', 'authenticated')::text, false)) c, lateral (select * from kpi_tables(p_round_table_id := (select id from round_tables where code = 'LUZ-07'))) t") === '{few_people}');

  // Alerts: queued once per table, recipient and week; running again adds nothing.
  sql('delete from notification_outbox');
  const queued = Number(sql('select app.enqueue_table_alerts()'));
  check('server: alerts are queued for the coordinator and the administrator', queued >= 2, String(queued));
  check('server: the coordinator of Fundación Luz is alerted about LUZ-07', Number(sql(`${TABLE_ALERTS} and auth_user_id = md5('gold-roundtables:user:coord')::uuid and data->>'round_table_id' = (select id::text from round_tables where code = 'LUZ-07')`)) === 1);
  check('server: another organization\'s coordinator is not', Number(sql(`${TABLE_ALERTS} and auth_user_id = md5('gold-roundtables:user:coord-horizonte')::uuid and data->>'round_table_id' = (select id::text from round_tables where code = 'LUZ-07')`)) === 0);
  check('server: the same week is deduplicated', Number(sql('select app.enqueue_table_alerts()')) === 0);

  const coord = await App.open(browser, 'coord-health');
  try {
    await coord.devSignIn('coord');
    await coord.click('Coordinador, Fundación Luz', { role: 'button' });
    await coord.waitFor('Estás como Coordinador, Fundación Luz', { timeout: 20_000 });
    check('coordinator home: the alerts card lists LUZ-07 with its reason', await coord.seen('LUZ-07 · Mesa Nueva 07', 20_000) && await coord.has('Menos de 3 personas'), (await coord.text()).slice(0, 500));
    await coord.shot('h-01-home-alerts');
    await coord.click('LUZ-07 · Mesa Nueva 07');
    check('tapping the alert opens the table detail with the reason chip', await coord.seen('Faltan 2 personas', 15_000) && await coord.has('Menos de 3 personas'), (await coord.text()).slice(0, 500));
    await coord.shot('h-02-table-detail');
  } finally {
    await coord.close();
  }

  const admin = await App.open(browser, 'admin-health');
  try {
    await admin.devSignIn('admin');
    await admin.click('Mesas', { role: 'button' });
    check('explorer: the grid shows the reason chip on LUZ-07', await admin.seen('Menos de 3 personas', 20_000), (await admin.text()).slice(0, 500));
    await admin.click(/^Menos de 3 personas/, { role: 'button' });
    check('explorer: the saved view keeps only the flagged tables', await admin.seen('LUZ-07 · Mesa Nueva 07', 10_000) && !(await admin.has('LUZ-01 · Mesa Fe 01')), (await admin.text()).slice(0, 500));
    await admin.shot('h-03-explorer-view');
  } finally {
    await admin.close();
  }
}
