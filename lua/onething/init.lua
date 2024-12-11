local onething = {}

-- load submodules
onething.commads = require("onething.commands")
onething.mappings = require("onething.mappings")


-- initialize the plugin
onething.setup = function()
    onething.commads.setup()
    onething.mappings.setup()

    local config = require("onething.config").get_config()
    onething.commads.create_update_floating_window(config.phrase)
end

return onething
