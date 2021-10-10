
--[=[
        State hook that tracks a numeric value.
        If no initial value is passed, it will default to 0.

        :::tip
        Counters can be increased/decreased by amount if you pass a number to it's function.
        :::

        ```lua
        local function HookedComponent(props, hooks)
                local count, increment, decrement, reset = useCounter()(hooks)

                return Roact.createFragment({
                        Counter = Roact.createElement(MyCounter, {
                                Text = tostring(count)
                        }),
                        Inc = Roact.createElement(Button, {
                                OnClick = function()
                                        increment()
                                end
                        }),
                        Dec = Roact.createElement(Button, {
                                OnClick = function()
                                        decrement()
                                end
                        }),
                        Reset = Roact.createElement(Button, {
                                OnClick = function()
                                        reset()
                                end
                        }),
                })
        end
        ```

        @function useCounter
        @within Hooks
        @param initialValue number | nil
        @return HookCreator<UseCounter>
]=]
local function useCounter(initialValue)
        assert(
                type(initialValue) == "number" or type(initialValue) == "nil",
                "Initial value must be of the type number or nil."
        )

        if not initialValue then
                initialValue = 0
        end

        return function(hooks)
                local count, setCount = hooks.useState(initialValue)

                local increment = hooks.useCallback(function(amount)
                        setCount(function(n)
                                return n + math.max(1, amount or 1)
                        end)
                end, { count })

                local decrement = hooks.useCallback(function(amount)
                        setCount(function(n)
                                return n - math.max(1, amount or 1)
                        end)
                end, { count })

                local reset = hooks.useCallback(function()
                        setCount(initialValue)
                end, {})

                return count, increment, decrement, reset
        end
end

return useCounter