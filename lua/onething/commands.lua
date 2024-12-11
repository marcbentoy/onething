local M = {}

local phrasebuf = nil
local phrasewin = nil

M.create_update_floating_window = function(phrase)
    local winconf = {
        relative = "editor",
        width = #phrase,
        height = 1,
        row = 1,
        col = vim.o.columns - #phrase,
        style = "minimal",
        border = "rounded",
    }

    if phrasebuf and vim.api.nvim_buf_is_valid(phrasebuf) and phrasewin and vim.api.nvim_win_is_valid(phrasewin) then
        vim.api.nvim_buf_set_lines(phrasebuf, 0, -1, false, { phrase })
        vim.api.nvim_win_set_width(phrasewin, #phrase)

        vim.api.nvim_win_set_config(phrasewin, winconf)
        return
    end

    phrasebuf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(phrasebuf, 0, -1, false, { phrase })

    phrasewin = vim.api.nvim_open_win(phrasebuf, false, winconf)
end

M.setup = function()
    vim.api.nvim_create_user_command(
        "UpdateOnething", function(opts)
            local phrase = opts.args
            M.create_update_floating_window(phrase)
        end,
        { nargs = 1, desc = "Update onething phrase" }
    )
end

return M
