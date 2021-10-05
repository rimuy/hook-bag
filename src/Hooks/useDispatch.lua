
local function useDispatch(useStore)
        return function(hooks)
                local store = useStore(hooks)

                local dispatch = hooks.useCallback(function(action)
                        store:dispatch(action)
                end, {})

                return dispatch
        end
end

return useDispatch