local M = {}

M.setup = function()
    vim.keymap.set("n", "<leader>otu", ":UpdateOnething ", { desc = "Update onething focus phrase" })
    vim.keymap.set("n", "<leader>otx", ":ToggleOnethingVisibilty<CR>", { desc = "Toggles onething visibility" })
end

return M
