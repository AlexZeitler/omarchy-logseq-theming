#!/bin/bash
#
# Unwires omarchy-logseq and removes its section from every custom.css.
# Any CSS you wrote yourself stays untouched.

set -euo pipefail

REPO_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

bash "$REPO_DIR/hooks/logseq" --remove

rm -f ~/.config/omarchy/themed/logseq.css.tpl
rm -f ~/.config/omarchy/hooks/theme-set.d/logseq

echo "Removed."
