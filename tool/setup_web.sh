#!/usr/bin/env bash
# Prepares the PowerSync web assets in web/:
# - sqlite3.wasm: downloaded for the resolved powersync version;
# - powersync_db.worker.js: compiled from this project's pubspec.lock.
#   The prebuilt worker from the powersync release can lag behind the
#   resolved sqlite_async protocol ("No enum value ... installBroadcastUpdates"),
#   so we compile it ourselves.
# Re-run after upgrading powersync/sqlite_async/sqlite3_web; commit the result.
set -euo pipefail
cd "$(dirname "$0")/.."

dart run powersync:setup_web --no-worker
dart compile js -O4 tool/web/powersync_db_worker.dart -o web/powersync_db.worker.js
rm -f web/powersync_db.worker.js.deps web/powersync_db.worker.js.map
