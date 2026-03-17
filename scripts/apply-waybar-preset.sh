#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LAYOUT_NAME="${1:-default}"
THEME_NAME="${2:-gruvbox}"

LAYOUT_PATH="$ROOT_DIR/layouts/${LAYOUT_NAME}.jsonc"
THEME_PATH="$ROOT_DIR/themes/${THEME_NAME}.css"
CONFIG_PATH="$ROOT_DIR/config.jsonc"
STYLE_PATH="$ROOT_DIR/style.css"
CURRENT_THEME_PATH="$ROOT_DIR/themes/current.css"

if [[ ! -f "$LAYOUT_PATH" ]]; then
  echo "Unknown layout: $LAYOUT_NAME" >&2
  exit 1
fi

if [[ ! -f "$THEME_PATH" ]]; then
  echo "Unknown theme: $THEME_NAME" >&2
  exit 1
fi

cp "$LAYOUT_PATH" "$CONFIG_PATH"
printf '@import url("themes/current.css");\n@import url("themes/base.css");\n' > "$STYLE_PATH"
printf '@import url("%s.css");\n' "$THEME_NAME" > "$CURRENT_THEME_PATH"

pkill waybar 2>/dev/null || true
nohup waybar >/dev/null 2>&1 &

echo "Applied layout '$LAYOUT_NAME' with theme '$THEME_NAME' and restarted Waybar."
