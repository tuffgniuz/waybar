# Waybar Presets

This setup is split into two reusable parts:

- `layouts/*.jsonc`: module arrangement, height, output, and behavior
- `themes/*.css`: colors for the same layout

Waybar still reads these active files:

- `config.jsonc`
- `style.css`

## Apply a preset

```bash
./scripts/apply-waybar-preset.sh default gruvbox
```

Example with the alternate theme:

```bash
./scripts/apply-waybar-preset.sh default forest
```

## Create a new theme

1. Copy `themes/gruvbox.css` to `themes/<your-theme>.css`.
2. Change only the `@define-color` values.
3. Apply it with `./scripts/apply-waybar-preset.sh default <your-theme>`.

This keeps structure and spacing the same while swapping the visual language.

## Create a new layout

1. Copy `layouts/default.jsonc` to `layouts/<your-layout>.jsonc`.
2. Change modules, groups, spacing, height, or output in that file.
3. Apply it with `./scripts/apply-waybar-preset.sh <your-layout> gruvbox`.

This lets you keep multiple bar arrangements saved side by side.
