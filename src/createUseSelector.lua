local useSelector = require(script.Parent.Hooks.useSelector)

local function createUseDispatch(useStore)
        return useSelector(useStore)
end

return createUseDispatch