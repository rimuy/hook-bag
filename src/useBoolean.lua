
local function createUseBoolean(initialValue, useCallback, useState)
        local value, setValue = useState(initialValue)

        local setTrue = useCallback(function()
                setValue(true)
        end, {})

        local setFalse = useCallback(function()
                setValue(false)
        end, {})

        local toggle = useCallback(function()
                setValue(function(value)
                        return not value
                end)
        end, { value })

        return value, setTrue, setFalse, toggle, setValue
end

local function useBoolean(initialValue)
        return function(hooks)
                assert(type(initialValue) == 'boolean', 'Initial value must be boolean')
                return createUseBoolean(initialValue, hooks.useCallback, hooks.useState)
        end
end

return useBoolean