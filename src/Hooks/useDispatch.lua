
--[=[
        Returns a reference to the `dispatch` function from the store.
        You may use it to dispatch actions as needed.

        ```lua
        local function Counter(props, hooks)
                local dispatch = useDispatch(hooks)

                return Roact.createFragment({
                        Label = Roact.createElement("TextLabel", {
                                Text = props.value
                        }),
                        Increment = Roact.createElement(Button, {
                                OnClick = function()
                                        dispatch({ type = "increment" })
                                end
                        })
                })
        end
        ```

        @function useDispatch
        @within Hooks
        @tag roact-rodux
        @tag rodux
        @param hooks RoactHooks
        @return () -> void
]=]
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