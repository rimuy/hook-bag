
local function createUseBoolean(initialValue, useCallback, useState)
        local value, setValue = useState(initialValue)

        local toggle = useCallback(function()
                setValue(function(v)
                        return not v
                end)
        end, { value })

        return value, toggle, setValue
end

local function useBoolean(initialValue)
        return function(hooks)
                assert(type(initialValue) == "boolean", "Initial value must be a boolean")
                return createUseBoolean(initialValue, hooks.useCallback, hooks.useState)
        end
end

return useBoolean