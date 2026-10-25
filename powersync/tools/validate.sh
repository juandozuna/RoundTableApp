#!/usr/bin/env bash
# Validates powersync/sync-rules.yaml with PowerSync's own parser and simulates the buckets each
# seeded user would download. Requires the local Supabase stack with the seed loaded.
#
#   bash powersync/tools/validate.sh
#
# @powersync/service-sync-rules needs Node ≥ 24; older hosts run it in the node:24 image.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
bash "$here/snapshot.sh"
major=$(node -p 'process.versions.node.split(".")[0]' 2>/dev/null || echo 0)
if [[ $major -ge 24 ]]; then
  (cd "$here" && [[ -d node_modules ]] || npm install --silent; node simulate-buckets.mjs)
else
  docker run --rm -v "$here/..":/powersync -w /powersync/tools node:24-alpine \
    sh -c '[ -d node_modules ] || npm install --silent; node simulate-buckets.mjs'
fi
