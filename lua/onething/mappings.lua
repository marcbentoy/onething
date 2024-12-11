local M = {}

M.setup = function()
    vim.keymap.set("n", "<leader>otu", ":UpdateOnething ", { desc = "Update onething focus phrase" })
end

return M
