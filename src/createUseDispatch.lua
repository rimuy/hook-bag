local useDispatch = require(script.Parent.Hooks.useDispatch)

local function createUseDispatch(useStore, useSelector)
        return useDispatch(useStore, useSelector)
end

return createUseDispatch