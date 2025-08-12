function ColorMyPencils(color)
	color = color or "terafox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


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
}
