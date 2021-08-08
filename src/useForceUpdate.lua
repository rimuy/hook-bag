
local function createUseForceUpdate(useCallback, useState)
        local _, dispatch = useState({})
        local memoizedDispatch = useCallback(function()
                dispatch({})
        end, { dispatch })

        return memoizedDispatch
end

local function useForceUpdate(hooks)
        return createUseForceUpdate(hooks.useCallback, hooks.useState)
end

return useForceUpdate