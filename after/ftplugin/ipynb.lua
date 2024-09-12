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
vim.keymap.set("n", "<leader>ji", function()
    local venv = os.getenv("CONDA_ACADEMY_KERNEL")
    if venv ~= nil then
        venv = string.match(venv, "/.+/(.+)")
        vim.cmd(("MoltenInit %s"):format(venv))
    else
        vim.cmd("MoltenInit python3")
    end
end, { desc = "Initialize Molten for python3", silent = true })

vim.keymap.set("n", "<leader>jI", ":MoltenInfo<CR>", { desc = "molten info" })
vim.keymap.set("n", "<leader>js", ":MoltenInterrupt<CR>", { desc = "stops current execution", silent = true })
-- vim.keymap.set("n", "<leader>jl", ":MoltenEvaluateLine<CR>", { desc = "evaluate line", silent = true })
vim.keymap.set("n", "<leader>jn", ":MoltenNext<CR>", { desc = "molten next" })
vim.keymap.set("n", "<leader>jN", ":MoltenPrev<CR>", { desc = "molten prev" })

-- vim.keymap.set("n", "<leader>jR", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
vim.keymap.set("n", "<leader>jo", ":noautocmd MoltenEnterOutput<CR>",
    { desc = "open output window", silent = true })
vim.keymap.set("n", "<leader>jh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
vim.keymap.set("n", "<leader>jd", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

vim.keymap.set("v", "<leader>je", ":<C-u>MoltenEvaluateVisual<CR>gv",
    { desc = "Execute visual selection", silent = true })

-- Quarto
local runner = require("quarto.runner")
vim.keymap.set("n", "<leader>jc", runner.run_cell, { desc = "run cell" })
vim.keymap.set("n", "<leader>ja", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<leader>jA", runner.run_all, { desc = "run all cells", silent = true })
vim.keymap.set("n", "<leader>jl", runner.run_line, { desc = "run line", silent = true })
-- vim.keymap.set("v", "<leader>jc", runner.run_range, { desc = "run visual range", silent = true })

-- TreeSitter objects
require("nvim-treesitter.configs").setup({
    textobjects = {
        move = {
            enable = true,
            set_jumps = false, -- you can change this if you want.
            goto_next_start = {
                ["<leader>je"] = { query = "@code_cell.inner", desc = "next code block" },
            },
            goto_previous_start = {
                ["<leader>jb"] = { query = "@code_cell.inner", desc = "previous code block" },
            },
        },
    }
})

-- Which-key
local wk = require("which-key")
wk.add({
    { "<leader>j", icon = "", group = "Jupyter" },

    -- Molten
    { "<leader>ji", icon = "", desc = "Initialize Molten" },
    { "<leader>jI", icon = "", desc = "Molten info" },
    { "<leader>js", icon = "", desc = "Interrupt kernel" },
    -- { "<leader>jl", icon = "", desc = "Create and evaluate from line" },
    { "<leader>jn", icon = "󰁅", desc = "Next cell" },
    { "<leader>jN", icon = "󰁝", desc = "Previous cell" },

    -- { "<leader>jR", icon = "", desc = "Reevaluate cell" },
    { "<leader>jo", icon = "󰿄", desc = "Enter output" },
    { "<leader>jh", icon = "󰿅", desc = "Hide output" },
    { "<leader>jd", icon = "󰆴", desc = "Delete cell" },

    {
        { mode = "v" },
        { "<leader>jv", icon = "", desc = "Evaluate visual" },

    },

    -- Quarto
    { "<leader>jc", icon = "", desc = "Run cell" },
    { "<leader>ja", icon = "", desc = "Run cell and above" },
    { "<leader>jA", icon = "", desc = "Run all cells" },
    { "<leader>jl", icon = "", desc = "Run line" },
    -- { "<leader>jc", icon = "", desc = "Run visual range" },
})
