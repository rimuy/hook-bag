
--[=[
        State hook that tracks value of a boolean.

        @function useToggle
        @within Hooks
        @param initialValue boolean
        @return HookCreator<UseToggle>
]=]
local function useToggle(initialValue)
        return function(hooks)
                assert(type(initialValue) == "boolean", "Initial value must be a boolean")
                local value, setValue = hooks.useState(initialValue)

                local toggle = hooks.useCallback(function(v)
                        setValue(function(currentValue)
                                return v or not currentValue
                        end)
                end, { value })

                return value, toggle
        end
end

return useToggle