require("anturated.remap")
require("anturated.set")
require("anturated.lazy_init")


-- autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup("YankHL", {})

-- autocmd("TextYankPost", {
-- 	group = yank_group,
-- 	pattern = '*',
-- 	callback = function()
-- 		vim.highlight.on_yank({
-- 			higroup = "IncSearch",
-- 			timeout = 40,
-- 		})
-- 	end,
-- })

-- TODO: figure out if i need this
vim.g.netrw_browse_split = 0 -- Open in the current window
vim.g.netrw_banner = 0       -- Hide banner
vim.g.netrw_winsize = 25     -- Set window size to 25%
