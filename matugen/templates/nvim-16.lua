require("base16-colorscheme").setup({
  base00 = "{{colors.background.default.hex}}",             -- background
  base01 = "{{colors.surface_container_high.default.hex}}", -- line hl, tab bar bg
  base02 = "{{colors.surface_container_high.default.hex}}", -- status line bg
  base03 = "{{colors.outline.default.hex}}",                -- inactive tab name, guidelines, comments
  base04 = "{{colors.outline.default.hex}}",                -- gutter numbers
  base05 = "{{colors.on_background.default.hex}}",          -- brackets, not active tab name, some statusline text, telescope, properties
  base06 = "#00ff00",                                       -- not even sure
  base07 = "#ff00ff",                                       -- git branch highlight?
  base08 = "{{colors.Pink.default.hex}}",                   -- classes, not X tab icon and errors
  base09 = "{{colors.tertiary.default.hex}}",               -- values / null
  base0A = "{{colors.Yellow.default.hex}}",                 -- types
  base0B = "{{colors.primary.default.hex}}",                -- strings
  base0C = "{{colors.tertiary.default.hex}}",               -- active guideline, collapse chevrons
  base0D = "{{colors.tertiary.default.hex}}",               -- functions
  base0E = "{{colors.error.default.hex}}",                  -- modifiers (public const etc.)
  base0F = "{{colors.secondary_fixed_dim.default.hex}}",    -- commas, semicolons, etc.
})
