-- Jupyter
-- Mappings
vim.keymap.set("n", "<localleader>je", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
vim.keymap.set("n", "<localleader>jo", ":noautocmd MoltenEnterOutput<CR>",
    { desc = "open output window", silent = true })
vim.keymap.set("n", "<localleader>jr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
vim.keymap.set("v", "<localleader>jv", ":<C-u>MoltenEvaluateVisual<CR>gv",
    { desc = "execute visual selection", silent = true })
vim.keymap.set("n", "<localleader>jh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
vim.keymap.set("n", "<localleader>jd", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

-- Which-key
local wk = require("which-key")
wk.add({
    { "<leader>j", icon = "", group = "Jupyter" },
    { "<leader>je", icon = "", desc = "Evaluate cell" },
    { "<leader>jo", icon = "", desc = "Enter output" },
    { "<leader>jr", icon = "", desc = "Reevaluate cell" },
    { "<leader>jv", icon = "", desc = "Evaluate visual" },
    { "<leader>jh", icon = "", desc = "Hide output" },
    { "<leader>jd", icon = "", desc = "Delete cell" },
})
