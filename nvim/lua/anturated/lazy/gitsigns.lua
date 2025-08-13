return {
    "lewis6991/gitsigns.nvim",
    -- TODO: change to opts
    dependencies = { "nvim-lua/plenary.nvim" },
    -- opts = {
    --   signs = {
    --
    --   }
    -- }
    --
    config = function()
        require("gitsigns").setup({
            signs              = {
                add          = { text = "▎" },
                change       = { text = "▎" },
                delete       = { text = "契" },
                topdelete    = { text = "契" },
                changedelete = { text = "▎" },
                untracked    = { text = "▎" },
            },
            signcolumn         = true,  -- Show git signs in the sign column
            numhl              = false, -- Or set to true to highlight line numbers instead
            current_line_blame = true, -- Inline blame text
        })
    end
}
