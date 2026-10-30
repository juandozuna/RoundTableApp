#!/usr/bin/env bash
# Regenerates localizations and all build_runner output (freezed, json,
# injectable, retrofit). Run after changing ARB files, annotations or
# generated models. Never edit generated files by hand.
set -euo pipefail
cd "$(dirname "$0")/.."

flutter pub get
flutter gen-l10n
# build_runner >= 2.15 always replaces conflicting outputs (the old
# --delete-conflicting-outputs flag was removed).
dart run build_runner build "$@"
