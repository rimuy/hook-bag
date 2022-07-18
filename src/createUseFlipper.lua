local useFlipper = require(script.Parent.Hooks.useFlipper)

local function createUseFlipper(flipper)
        return useFlipper(require(flipper))
end

return createUseFlipper