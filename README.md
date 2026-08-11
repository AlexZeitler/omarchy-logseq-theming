# omarchy-logseq-theming

Themes [Logseq](https://logseq.com) with your current [Omarchy](https://omarchy.org)
theme, and re-themes it whenever you switch themes.

Works with every Omarchy theme that ships a `colors.toml`, including your own.
No fork of Omarchy, no patched files under `~/.local/share/omarchy`, nothing
that an `omarchy update` can undo.

## Install

```bash
git clone https://github.com/AlexZeitler/omarchy-logseq-theming ~/.local/share/omarchy-logseq-theming
~/.local/share/omarchy-logseq-theming/install.sh
```

That is it. Logseq watches `custom.css` and repaints itself, so a running
instance picks up the theme without a restart. Same on every later theme
switch.

To update later:

```bash
git -C ~/.local/share/omarchy-logseq-theming pull
```

No reinstall needed. The installer links the files instead of copying them.

## How it works

Omarchy already has both hooks this needs. `install.sh` only creates two
symlinks:

`~/.config/omarchy/themed/logseq.css.tpl`
: A template with Logseq's `--ls-*` CSS variables and Omarchy's colour
  placeholders. On every theme switch, `omarchy-theme-set-templates` fills it
  from the theme's `colors.toml` and writes the result to
  `~/.config/omarchy/current/theme/logseq.css`. This is the same mechanism
  Omarchy uses for Obsidian, Alacritty and btop.

`~/.config/omarchy/hooks/theme-set.d/logseq`
: A hook that `omarchy-theme-set` runs at the end of every theme switch. It
  copies the generated CSS into `<graph>/logseq/custom.css` for every graph.

Both paths live under `~/.config/omarchy`, which belongs to you. Omarchy
updates never write there, so the setup survives them.

## Your own CSS is safe

The hook writes into a marked section at the end of `custom.css`:

```css
/* >>> omarchy-logseq: begin, do not edit >>> */
...
/* <<< omarchy-logseq: end <<< */
```

Everything outside those markers is left alone. On the next theme switch, only
the section between them is replaced.

## Graphs

By default the hook derives graph paths from the file names under
`~/.logseq/graphs/`. If a graph is missed, list the paths explicitly, one per
line:

```bash
mkdir -p ~/.config/omarchy-logseq
cat > ~/.config/omarchy-logseq/graphs <<'EOF'
~/Documents/notes
/mnt/data/second-brain
EOF
```

That file takes precedence over auto-detection.

## Per-theme overrides

A theme may ship its own `logseq.css`. Omarchy copies theme files before it
renders templates and never overwrites what is already there, so a theme's own
file wins over this template.

## Uninstall

```bash
~/.local/share/omarchy-logseq-theming/uninstall.sh
```

This unlinks both files and removes the marked section from every
`custom.css`.

## Notes

- Logseq has no global stylesheet. CSS lives per graph, in
  `<graph>/logseq/custom.css`. That is why this needs a hook and not just a
  template.
- The template targets both `html[data-theme="dark"]` and
  `html[data-theme="light"]`, so Logseq's own light/dark toggle no longer
  changes the palette. The Omarchy theme decides.
- Shades are built with `color-mix()`, which Logseq's Electron runtime
  supports.
