local usePortal = require(script.Parent.Hooks.usePortal)

local function createUsePortal(roactSource)
        return usePortal(require(roactSource))
end

return createUsePortal