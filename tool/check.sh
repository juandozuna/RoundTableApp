#!/usr/bin/env bash
# Static analysis and tests. Must pass before every commit.
set -euo pipefail
cd "$(dirname "$0")/.."

flutter analyze
flutter test "$@"
