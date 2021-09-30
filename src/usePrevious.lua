
local function usePrevious(value)
        return function(hooks)
                local currentValue = hooks.useValue(value)
                local previousValue = hooks.useValue()

                if currentValue.value ~= value then
                        previousValue.value = currentValue.value
                        currentValue.value = value
                end

                return previousValue.value
        end
end

return usePrevious