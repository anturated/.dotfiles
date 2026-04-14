require("palette").setup({
  palettes = {
    main = "custom_main_palette",
    accent = "custom_accent_palette",
    state = "custom_state_palette",
  },

  italics = true,
  transparent_background = true,


  custom_palettes = {
    main = {
      custom_main_palette = {
        color0 = "{{colors.background.default.hex}}",                -- bg
        color1 = "{{colors.surface_container_highest.default.hex}}", -- line + statusline text
        color2 = "{{colors.secondary.default.hex}}",                 -- active collapse chevron
        color3 = "{{colors.secondary_fixed_dim.default.hex}}",       -- function / import / return / inactive gutter / folder
        color4 = "{{colors.on_surface_variant.default.hex}}",        -- active gutter, inactive chevron, brackets etc.
        color5 = "{{colors.tertiary.default.hex}}",                  -- key hints, properties
        color6 = "{{colors.outline.default.hex}}",                   -- comments, inactive tab
        color7 = "{{colors.primary.default.hex}}",                   -- functions
        color8 = "{{colors.on_background.default.hex}}",             -- strings, files, types
      },
    },
    accent = {
      custom_accent_palette = {
        accent0 = "{{colors.Red.default.hex}}",
        accent1 = "{{colors.Peach.default.hex}}",
        accent2 = "{{colors.Yellow.default.hex}}",
        accent3 = "{{colors.Green.default.hex}}",
        accent4 = "{{colors.Sapphire.default.hex}}",
        accent5 = "{{colors.Pink.default.hex}}",
        accent6 = "{{colors.Mauve.default.hex}}",
      },
    },
    state = {
      custom_state_palette = {
        error = "{{colors.error.default.hex}}",
        warning = "{{colors.Peach.default.hex}}",
        hint = "{{colors.Yellow.default.hex}}",
        ok = "{{colors.Green.default.hex}}",
        info = "{{colors.Sapphire.default.hex}}",
      },
    },
  },
})
