-- change the configuration when editing a python file
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.py",
  callback = function(e)
    if string.match(e.file, ".otter.") then
      return
    end
    if require("molten.status").initialized() == "Molten" then -- this is kinda a hack...
      vim.fn.MoltenUpdateOption("virt_lines_off_by_1", false)
      vim.fn.MoltenUpdateOption("virt_text_output", false)
    else
      vim.g.molten_virt_lines_off_by_1 = false
      vim.g.molten_virt_text_output = false
    end
  end,
})

-- Undo those config changes when we go back to a markdown or quarto file
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.qmd", "*.md", "*.ipynb" },
  callback = function(e)
    if string.match(e.file, ".otter.") then
      return
    end
    if require("molten.status").initialized() == "Molten" then
      vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
      vim.fn.MoltenUpdateOption("virt_text_output", true)
    else
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_virt_text_output = true
    end
  end,
})

-- Mappings
-- Molten
vim.keymap.set("n", "<localleader>jme", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
vim.keymap.set("n", "<localleader>jmo", ":noautocmd MoltenEnterOutput<CR>",
    { desc = "open output window", silent = true })
vim.keymap.set("n", "<localleader>jmr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
vim.keymap.set("n", "<localleader>jmh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
vim.keymap.set("n", "<localleader>jmd", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })
-- vim.keymap.set("v", "<localleader>jmv", ":<C-u>MoltenEvaluateVisual<CR>gv",
--     { desc = "execute visual selection", silent = true })

-- Quarto
local runner = require("quarto.runner")
vim.keymap.set("n", "<localleader>jqr", runner.run_cell, { desc = "run cell" })
vim.keymap.set("n", "<localleader>jqa", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<localleader>jqA", runner.run_all, { desc = "run all cells", silent = true })
vim.keymap.set("n", "<localleader>jql", runner.run_line, { desc = "run line", silent = true })
-- vim.keymap.set("v", "<localleader>jqr", runner.run_range, { desc = "run visual range", silent = true })

-- Which-key
local wk = require("which-key")
wk.add({
    { "<leader>j", icon = "", group = "Jupyter" },

    { "<leader>jm", icon = "", group = "Molten" },
    { "<leader>jme", icon = "", desc = "Evaluate cell" },
    { "<leader>jmo", icon = "", desc = "Enter output" },
    { "<leader>jmr", icon = "", desc = "Reevaluate cell" },
    { "<leader>jmh", icon = "", desc = "Hide output" },
    { "<leader>jmd", icon = "", desc = "Delete cell" },
    -- { "<leader>jmv", icon = "", desc = "Evaluate visual" },

    { "<leader>jq", icon = "", group = "Quarto" },
    { "<leader>jqr", icon = "", desc = "Run cell" },
    { "<leader>jqa", icon = "", desc = "Run cell and above" },
    { "<leader>jqA", icon = "", desc = "Run all cells" },
    { "<leader>jql", icon = "", desc = "Run line" },
    -- { "<leader>jqR", icon = "", desc = "Run visual range" },
})
