local useDispatch = require(script.Parent.Hooks.useDispatch)

local function createUseDispatch(useStore)
        return useDispatch(useStore)
end

return createUseDispatch