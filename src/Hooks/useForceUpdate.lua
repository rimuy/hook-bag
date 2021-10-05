
local function useForceUpdate(hooks)
        local _, dispatch = hooks.useState({})
        local memoizedDispatch = hooks.useCallback(function()
                dispatch({})
        end, { dispatch })

        return memoizedDispatch
end

return useForceUpdate