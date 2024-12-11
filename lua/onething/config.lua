local default_config = {
    phrase = "Stay Focused!", -- Default phrase
}

local M = {}

function M.get_config(user_config)
    return vim.tbl_deep_extend("force", default_config, user_config or {})
end

return M
