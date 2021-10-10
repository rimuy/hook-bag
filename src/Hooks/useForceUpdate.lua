
--[=[
        Returns a callback that once called, will cause the component to re-render.

        @function useForceUpdate
        @within Hooks
        @param hooks RoactHooks
        @return () -> void
]=]
local function useForceUpdate(hooks)
        local _, dispatch = hooks.useState({})
        local memoizedDispatch = hooks.useCallback(function()
                dispatch({})
        end, { dispatch })

        return memoizedDispatch
end

return useForceUpdate