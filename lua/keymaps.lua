local M = {}

-- General
M.general = function()
    -- Navigate vim panes better
    vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", {})
    vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", {})
    vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", {})
    vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", {})

    -- Turn off highlighting
    vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
end

-- Debug Adapter Protocol
M.dap = function()
    -- Keymaps
    local dap = require("dap")
    vim.keymap.set("n", "<Leader>Db", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>Dc", dap.continue, {})
    vim.keymap.set("n", "<Leader>Dq", dap.terminate, {})
    vim.keymap.set("n", "<Leader>Do", dap.step_over, {})
    vim.keymap.set("n", "<Leader>Di", dap.step_into, {})
    vim.keymap.set("n", "<Leader>DO", dap.step_out, {})
    vim.keymap.set("n", "<Leader>Dr", dap.repl.toggle, {})

    -- Which-key
    local wk = require("which-key")
    wk.add({
        -- DAP
        { "<leader>D", icon = "", group = "DAP" },
        { "<leader>Db", icon = "", desc = "Toggle breakpoint" },
        { "<leader>Dc", icon = "", desc = "Start debugging" },
        { "<leader>Dq", icon = "", desc = "Terminate debugging" },
        { "<leader>Do", icon = "", desc = "Step over" },
        { "<leader>Di", icon = "", desc = "Step into" },
        { "<leader>DO", icon = "", desc = "Step out" },
        { "<leader>Dr", icon = "", desc = "Open REPL" },
    })
end

-- LSP and diagnostics
M.lsp = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, {})
    vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, {})
    vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, {})
    vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, {})
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})

    vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, {})
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {})
    vim.keymap.set("n", "<leader>dN", vim.diagnostic.goto_prev, {})
    vim.keymap.set("n", "<leader>dq", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, {})
end

M.treesitter = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>b", builtin.buffers, {})
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fh", builtin.oldfiles, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fm", builtin.marks, {})
    vim.keymap.set("n", "<leader>fc", builtin.colorscheme, {})
end

M.wk = function()
    local wk = require("which-key")

    wk.add({
        -- Global
        { "<leader>e", icon = "", desc = "Open filesystem sidebar" },
        { "<leader>E", icon = "", desc = "Close filesystem sidebar" },
        { "<leader>b", icon = "", desc = "Show buffers" },
        -- { "<leader>f",   group = "Telescope" },
        { "<leader>fc", desc = "Select colorscheme" },
        { "<leader>ff", desc = "Find files by name" },
        { "<leader>fg", desc = "Find files using content (grep)" },
        { "<leader>fh", desc = "Open recent files" },
        { "<leader>fm", desc = "Jump to bookmarks" },
        { "<leader>g", group = "NeoGit" },
        { "<leader>gg", desc = "Run NeoGit" },
        { "<leader>gs", desc = "Git Status" },
        { "<leader>h", desc = "Disable search highlight" },
        { "<leader>l", group = "LSP" },
        { "<leader>lD", desc = "Go to declaration" },
        { "<leader>lR", desc = "Rename symbol" },
        { "<leader>la", desc = "Code action" },
        { "<leader>ld", desc = "Go to definition" },
        { "<leader>le", desc = "Open floating diagnostic" },
        { "<leader>lf", desc = "Format" },
        { "<leader>lr", desc = "Search references" },
        { "<leader>t", group = "Neo-tree" },
        { "<leader>tg", desc = "Show git status" },
        { "<leader>ts", desc = "Show document symbols" },
    })
end

M.setup = function()
    M.general()
    M.dap()
    M.lsp()
    M.treesitter()
    M.wk()
end

return M
