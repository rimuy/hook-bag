
local function noop() end

--[=[
        Returns a function that executes the `dispatch` method of the store.
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
local function useDispatch(useStore, useSelector)
        return function(hooks)
                local store = useStore(hooks)

                local dispatch = hooks.useCallback(function(action)
                        store:dispatch(action)
                end, { store })

                -- For creating a connection to the store if no components are listening to changes
                useSelector(noop)(hooks)

                return dispatch
        end
end

return useDispatch