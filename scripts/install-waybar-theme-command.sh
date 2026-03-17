#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BIN_DIR="${HOME}/.local/bin"
TARGET_PATH="${BIN_DIR}/waybar-theme"
SOURCE_PATH="${ROOT_DIR}/scripts/apply-waybar-preset.sh"

mkdir -p "${BIN_DIR}"

cat > "${TARGET_PATH}" <<EOF
#!/usr/bin/env bash
exec "${SOURCE_PATH}" "\$@"
EOF

chmod +x "${TARGET_PATH}"

echo "Installed waybar-theme to ${TARGET_PATH}"
