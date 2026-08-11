/* Omarchy theme for Logseq
 *
 * omarchy-theme-set-templates fills this template from the theme's
 * colors.toml on every theme switch. It only uses placeholders that every
 * Omarchy theme provides: background, foreground, cursor, accent,
 * selection_background, selection_foreground and color0 through color15.
 *
 * Shades are derived with color-mix so the template needs no extra colors
 * beyond that set.
 *
 * Two things about Logseq 0.10 decide the selectors below.
 *
 * First, Logseq defines its variables on several elements at once:
 *   html[data-theme=dark][data-color=logseq]
 *   html[data-color=X] body, html[data-color=X] .light-theme, ... .dark-theme
 * A rule on `html[data-theme=dark]` alone loses on specificity, and a value
 * inherited from `html` loses against body's own declaration regardless of
 * specificity. So we target the same elements and add one attribute more.
 *
 * Second, Logseq is mid-migration to a Radix scale. Newer components read
 * --lx-gray-* and --lx-accent-* first and only fall back to --ls-*, e.g.
 *   h1.title { color: var(--lx-gray-12, var(--ls-title-text-color, ...)) }
 * Both families have to be set or half the UI keeps its stock colours.
 */

:root[data-theme][data-color],
:root[data-theme][data-color] body,
:root[data-theme][data-color] .light-theme,
:root[data-theme][data-color] .dark-theme {
  /* Radix grey scale: 01 app background ... 12 high contrast text */
  --lx-gray-01: {{ background }};
  --lx-gray-02: color-mix(in srgb, {{ foreground }} 3%, {{ background }});
  --lx-gray-03: color-mix(in srgb, {{ foreground }} 6%, {{ background }});
  --lx-gray-04: color-mix(in srgb, {{ foreground }} 9%, {{ background }});
  --lx-gray-05: color-mix(in srgb, {{ foreground }} 12%, {{ background }});
  --lx-gray-06: color-mix(in srgb, {{ foreground }} 16%, {{ background }});
  --lx-gray-07: color-mix(in srgb, {{ foreground }} 22%, {{ background }});
  --lx-gray-08: color-mix(in srgb, {{ foreground }} 30%, {{ background }});
  --lx-gray-09: color-mix(in srgb, {{ foreground }} 45%, {{ background }});
  --lx-gray-10: color-mix(in srgb, {{ foreground }} 55%, {{ background }});
  --lx-gray-11: color-mix(in srgb, {{ foreground }} 72%, {{ background }});
  --lx-gray-12: {{ foreground }};

  /* Radix accent scale: 09 is the solid accent */
  --lx-accent-01: color-mix(in srgb, {{ accent }} 4%, {{ background }});
  --lx-accent-02: color-mix(in srgb, {{ accent }} 8%, {{ background }});
  --lx-accent-03: color-mix(in srgb, {{ accent }} 14%, {{ background }});
  --lx-accent-04: color-mix(in srgb, {{ accent }} 20%, {{ background }});
  --lx-accent-05: color-mix(in srgb, {{ accent }} 28%, {{ background }});
  --lx-accent-06: color-mix(in srgb, {{ accent }} 38%, {{ background }});
  --lx-accent-07: color-mix(in srgb, {{ accent }} 50%, {{ background }});
  --lx-accent-08: color-mix(in srgb, {{ accent }} 70%, {{ background }});
  --lx-accent-09: {{ accent }};
  --lx-accent-10: color-mix(in srgb, {{ accent }} 90%, {{ foreground }});
  --lx-accent-11: color-mix(in srgb, {{ accent }} 75%, {{ foreground }});
  --lx-accent-12: color-mix(in srgb, {{ accent }} 45%, {{ foreground }});

  /* Surfaces */
  --ls-primary-background-color: {{ background }};
  --ls-secondary-background-color: color-mix(in srgb, {{ foreground }} 5%, {{ background }});
  --ls-tertiary-background-color: color-mix(in srgb, {{ foreground }} 9%, {{ background }});
  --ls-quaternary-background-color: color-mix(in srgb, {{ foreground }} 13%, {{ background }});
  --ls-quinary-background-color: color-mix(in srgb, {{ foreground }} 17%, {{ background }});
  --ls-senary-background-color: color-mix(in srgb, {{ foreground }} 21%, {{ background }});
  --ls-table-tr-even-background-color: color-mix(in srgb, {{ foreground }} 5%, {{ background }});
  --ls-block-properties-background-color: color-mix(in srgb, {{ foreground }} 7%, {{ background }});
  --ls-page-properties-background-color: color-mix(in srgb, {{ foreground }} 7%, {{ background }});
  --ls-slide-background-color: {{ background }};
  --ls-notification-background: color-mix(in srgb, {{ foreground }} 9%, {{ background }});

  /* Text */
  --ls-primary-text-color: {{ foreground }};
  --ls-secondary-text-color: color-mix(in srgb, {{ foreground }} 70%, {{ background }});
  --ls-title-text-color: {{ foreground }};
  --ls-left-sidebar-text-color: color-mix(in srgb, {{ foreground }} 85%, {{ background }});
  --ls-notification-text-color: {{ foreground }};

  /* Borders */
  --ls-border-color: color-mix(in srgb, {{ foreground }} 18%, {{ background }});
  --ls-secondary-border-color: color-mix(in srgb, {{ foreground }} 12%, {{ background }});
  --ls-tertiary-border-color: color-mix(in srgb, {{ foreground }} 24%, {{ background }});
  --ls-left-sidebar-border-color: color-mix(in srgb, {{ foreground }} 12%, {{ background }});
  --ls-settings-header-border-color: color-mix(in srgb, {{ foreground }} 18%, {{ background }});
  --ls-guideline-color: color-mix(in srgb, {{ foreground }} 20%, {{ background }});

  /* Selection */
  --ls-selection-background-color: {{ selection_background }};
  --ls-selection-text-color: {{ selection_foreground }};

  /* Accent */
  --ls-active-primary-color: {{ accent }};
  --ls-active-secondary-color: {{ color4 }};
  --ls-focus-ring-color: {{ accent }};
  --ls-create-button-color: {{ accent }};
  --ls-create-button-color-focus: {{ accent }};
  --ls-create-button-color-sm: {{ accent }};
  --ls-create-button-color-sm-focus: {{ accent }};
  --ls-icon-color: color-mix(in srgb, {{ foreground }} 70%, {{ background }});
  --ls-search-icon-color: color-mix(in srgb, {{ foreground }} 70%, {{ background }});
  --ls-search-icon-hover-color: {{ accent }};
  --ls-menu-hover-color: color-mix(in srgb, {{ foreground }} 12%, {{ background }});
  --ls-right-sidebar-topbar-color: {{ background }};
  --ls-a-chosen-bg: color-mix(in srgb, {{ accent }} 25%, {{ background }});

  /* Links and tags */
  --ls-link-text-color: {{ color4 }};
  --ls-link-text-hover-color: {{ accent }};
  --ls-link-ref-text-color: {{ color4 }};
  --ls-link-ref-text-hover-color: {{ accent }};
  --ls-block-ref-link-text-color: {{ color5 }};
  --ls-tag-text-color: {{ color6 }};
  --ls-tag-text-hover-color: {{ accent }};
  --ls-tag-text-opacity: 1;
  --ls-tag-text-hover-opacity: 1;

  /* Blocks */
  --ls-block-bullet-color: color-mix(in srgb, {{ foreground }} 55%, {{ background }});
  --ls-block-bullet-active-color: {{ accent }};
  --ls-block-bullet-border-color: color-mix(in srgb, {{ accent }} 45%, {{ background }});
  --ls-block-left-color: color-mix(in srgb, {{ foreground }} 20%, {{ background }});
  --ls-block-highlight-color: color-mix(in srgb, {{ accent }} 18%, {{ background }});

  /* Inline code */
  --ls-page-inline-code-color: {{ color6 }};
  --ls-page-inline-code-bg-color: color-mix(in srgb, {{ foreground }} 9%, {{ background }});

  /* Blockquotes */
  --ls-page-blockquote-color: color-mix(in srgb, {{ foreground }} 85%, {{ background }});
  --ls-page-blockquote-bg-color: color-mix(in srgb, {{ foreground }} 6%, {{ background }});
  --ls-page-blockquote-border-color: {{ accent }};

  /* Marks and checkboxes */
  --ls-page-mark-color: {{ background }};
  --ls-page-mark-bg-color: {{ color3 }};
  --ls-page-checkbox-color: {{ accent }};
  --ls-page-checkbox-border-color: color-mix(in srgb, {{ foreground }} 45%, {{ background }});
  --ls-cloze-text-color: {{ color1 }};

  /* States */
  --ls-error-text-color: {{ color1 }};
  --ls-error-background-color: color-mix(in srgb, {{ color1 }} 20%, {{ background }});
  --ls-success-text-color: {{ color2 }};
  --ls-success-background-color: color-mix(in srgb, {{ color2 }} 20%, {{ background }});
  --ls-warning-text-color: {{ color3 }};
  --ls-warning-background-color: color-mix(in srgb, {{ color3 }} 20%, {{ background }});

  /* Scrollbar */
  --ls-scrollbar-background-color: {{ background }};
  --ls-scrollbar-foreground-color: color-mix(in srgb, {{ foreground }} 25%, {{ background }});
  --ls-scrollbar-thumb-hover-color: color-mix(in srgb, {{ foreground }} 40%, {{ background }});

  /* Progress pie */
  --ls-pie-bg-color: color-mix(in srgb, {{ foreground }} 20%, {{ background }});
  --ls-pie-fg-color: {{ accent }};
}

/* Headings. Logseq styles rendered blocks and the editor with different
 * classes, so both are listed. */
.ls-block h1, .editor-inner .h1.uniline-block { color: {{ color1 }}; }
.ls-block h2, .editor-inner .h2.uniline-block { color: {{ color2 }}; }
.ls-block h3, .editor-inner .h3.uniline-block { color: {{ color3 }}; }
.ls-block h4, .editor-inner .h4.uniline-block { color: {{ color4 }}; }
.ls-block h5, .editor-inner .h5.uniline-block { color: {{ color5 }}; }
.ls-block h6, .editor-inner .h6.uniline-block { color: {{ color5 }}; }

/* Task markers */
.block-marker.TODO, .block-marker.LATER { color: {{ color1 }}; }
.block-marker.DOING, .block-marker.NOW { color: {{ color3 }}; }
.block-marker.DONE { color: {{ color2 }}; }
.block-marker.WAITING { color: {{ color5 }}; }
