local usePortal = require(script.Parent.Hooks.usePortal)

local function createUsePortal(roactSource)
        local Roact = require(roactSource)

        return usePortal(Roact)
end

return createUsePortal