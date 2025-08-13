return {
    "rebelot/heirline.nvim",
    event = "BufEnter",
    opts = function()
        local conditions = require "heirline.conditions"
        local utils = require "heirline.utils"

        -- Basic colors (you can change to match your theme)
        local colors = {
            fg = utils.get_highlight("Normal").fg,
            bg = utils.get_highlight("Normal").bg,
            git = utils.get_highlight("DiffAdd").fg,
            diag_error = utils.get_highlight("DiagnosticError").fg,
            diag_warn = utils.get_highlight("DiagnosticWarn").fg,
            diag_info = utils.get_highlight("DiagnosticInfo").fg,
            diag_hint = utils.get_highlight("DiagnosticHint").fg,
        }

        -- Mode component
        local Mode = {
            provider = function()
                return " " .. vim.fn.mode():upper() .. " "
            end,
            hl = { fg = colors.bg, bg = colors.git, bold = true },
        }

        -- Git branch
        local Git = {
            condition = conditions.is_git_repo,
            provider = function()
                return "  " .. vim.b.gitsigns_head .. " "
            end,
            hl = { fg = colors.git, bold = true },
        }

        -- File info
        local FileInfo = {
            provider = function()
                local name = vim.fn.expand("%:t")
                return name ~= "" and (" " .. name .. " ") or " [No Name] "
            end,
            hl = { fg = colors.fg },
        }

        -- Diagnostics
        local Diagnostics = {
            condition = conditions.has_diagnostics,
            static = {
                error_icon = " ",
                warn_icon = " ",
                info_icon = " ",
                hint_icon = " ",
            },
            update = { "DiagnosticChanged", "BufEnter" },
            provider = function(self)
                local result = {}
                for severity, icon in pairs {
                    error = self.error_icon,
                    warn = self.warn_icon,
                    info = self.info_icon,
                    hint = self.hint_icon,
                } do
                    local n = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[string.upper(severity)] })
                    if n > 0 then
                        table.insert(result, icon .. n)
                    end
                end
                return " " .. table.concat(result, " ") .. " "
            end,
            hl = { fg = colors.fg },
        }

        -- LSP active clients
        local LSP = {
            condition = conditions.lsp_attached,
            provider = function()
                local names = {}
                for _, client in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
                    table.insert(names, client.name)
                end
                return "  " .. table.concat(names, ", ")
            end,
            hl = { fg = colors.fg },
        }

        -- Statusline layout
        local StatusLine = {
            hl = { fg = colors.fg, bg = colors.bg },
            Mode,
            Git,
            FileInfo,
            Diagnostics,
            utils.align, -- fill space
            LSP,
        }

        -- Simple tabline with buffer list
        local TabLine = {
            utils.make_buflist(
                {
                    provider = function(self)
                        local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.bufnr), ":t")
                        return (self.is_active and "[ " or "  ") .. name .. (self.is_active and " ]" or "  ")
                    end,
                    hl = function(self)
                        return self.is_active
                            and { fg = colors.bg, bg = colors.git, bold = true }
                            or { fg = colors.fg, bg = colors.bg }
                    end,
                }
            ),
            utils.align,
        }

        return {
            statusline = StatusLine,
            tabline = TabLine,
            opts = { colors = colors },
        }
    end,
}
