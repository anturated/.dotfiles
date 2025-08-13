function ColorMyPencils(color)
	color = color or "kanagawa-paper-ink"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- TODO: i have no idea how the above is supposed to work
-- but it could be good

return {
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        transparent=true, -- enable in polish
      })
            ColorMyPencils();
    end,
  },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })

            ColorMyPencils();
        end
    },

    {
        "thesimonho/kanagawa-paper.nvim",
        config = function()
            ColorMyPencils();
        end,
    }
}
