
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

                local increment = hooks.useCallback(function()
                        setCount(function(n)
                                return n + 1
                        end)
                end, { count })

                local decrement = hooks.useCallback(function()
                        setCount(function(n)
                                return n - 1
                        end)
                end, { count })

                local reset = hooks.useCallback(function()
                        setCount(initialValue)
                end, {})

                return count, increment, decrement, reset
        end
end

return useCounter