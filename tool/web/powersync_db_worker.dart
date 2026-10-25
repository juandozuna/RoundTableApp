// Entry point of web/powersync_db.worker.js, compiled by tool/setup_web.sh
// from the packages in pubspec.lock so the worker protocol always matches the
// app's sqlite_async/sqlite3_web versions.
import 'package:powersync/web_worker.dart' as powersync_worker;

void main() => powersync_worker.main();
