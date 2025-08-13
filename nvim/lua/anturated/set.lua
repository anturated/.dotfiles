-- relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tab stuff
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- ???
vim.opt.smartindent = true

-- wrap
vim.opt.wrap = false

-- we ball
vim.opt.swapfile = false
vim.opt.backup = false

-- we love undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- highlights
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- enable true color
vim.opt.termguicolors = true

-- have lines above and below cursor
vim.opt.scrolloff = 8

-- idk what this does
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- highlight 80th col
vim.opt.colorcolumn = "80"

-- background
--
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--

-- vim.cmd.colorscheme("terafox")

-- vim.cmd [[
--   hi Normal guibg=NONE ctermbg=NONE
--   hi NormalNC guibg=NONE ctermbg=NONE
--   hi NvimTreeNormal guibg=NONE ctermbg=NONE
--   hi TelescopeNormal guibg=NONE ctermbg=NONE
--   hi Pmenu guibg=NONE ctermbg=NONE
--   hi FloatBorder guibg=NONE ctermbg=NONE
-- ]]
