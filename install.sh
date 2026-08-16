#!/bin/bash
#
# Wires omarchy-logseq into Omarchy.
#
# It creates two symlinks, both below ~/.config/omarchy. That directory
# belongs to you, and an Omarchy update never touches it. Because these are
# symlinks and not copies, a later "git pull" is all it takes to update.

set -euo pipefail

REPO_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Omarchy 4 ("Quattro") ships as a package below /usr/share, earlier releases
# live in the home directory. Omarchy sets OMARCHY_PATH itself, so only fill
# it in when the variable is missing.
if [[ -z ${OMARCHY_PATH:-} ]]; then
  for dir in /usr/share/omarchy "$HOME/.local/share/omarchy"; do
    [[ -d $dir ]] && export OMARCHY_PATH="$dir" && break
  done
fi

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
#
# Omarchy 4 ("Quattro") keeps the theme name in the state directory, earlier
# releases keep it in the config directory.
theme=""
for name_file in ~/.local/state/omarchy/current/theme.name ~/.config/omarchy/current/theme.name; do
  [[ -f $name_file ]] && theme=$(cat "$name_file") && break
done

[[ -n $theme ]] || {
  echo "No current Omarchy theme found. Set a theme, then run this again."
  exit 1
}

echo "Re-applying theme '$theme' ..."
OMARCHY_THEME_SKIP_BACKGROUND=1 omarchy-theme-set "$theme"

echo
echo "Done. A running Logseq picks up the colors on its own."
