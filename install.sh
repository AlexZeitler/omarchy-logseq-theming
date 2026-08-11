#!/bin/bash
#
# Wires omarchy-logseq into Omarchy.
#
# It creates two symlinks, both below ~/.config/omarchy. That directory
# belongs to you, and an Omarchy update never touches it. Because these are
# symlinks and not copies, a later "git pull" is all it takes to update.

set -euo pipefail

REPO_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export OMARCHY_PATH="${OMARCHY_PATH:-$HOME/.local/share/omarchy}"

command -v omarchy-theme-set >/dev/null || {
  echo "Omarchy not found: omarchy-theme-set is not in PATH."
  exit 1
}

mkdir -p ~/.config/omarchy/themed ~/.config/omarchy/hooks/theme-set.d

ln -snf "$REPO_DIR/themed/logseq.css.tpl" ~/.config/omarchy/themed/logseq.css.tpl
ln -snf "$REPO_DIR/hooks/logseq" ~/.config/omarchy/hooks/theme-set.d/logseq

echo "Linked:"
echo "  ~/.config/omarchy/themed/logseq.css.tpl"
echo "  ~/.config/omarchy/hooks/theme-set.d/logseq"

# Re-apply the current theme so logseq.css is generated right away and the
# hook runs once. Without this, nothing happens until the next theme switch.
# The wallpaper stays as it is.
theme=$(cat ~/.config/omarchy/current/theme.name)
echo "Re-applying theme '$theme' ..."
OMARCHY_THEME_SKIP_BACKGROUND=1 omarchy-theme-set "$theme"

echo
echo "Done. A running Logseq picks up the colors on its own."
