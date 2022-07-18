local useSelector = require(script.Parent.Hooks.useSelector)

local function createUseDispatch(roselect, useStore)
        return useSelector(require(roselect), useStore)
end

return createUseDispatch