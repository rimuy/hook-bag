local useTimeout = require(script.Parent.useTimeout)
local useUpdateEffect = require(script.Parent.useUpdateEffect)

local function useDebounce(time, callback, deps)
        return function(hooks)
                local timeout = hooks.useValue()
                local createTimeout = hooks.useCallback(function()
                        return useTimeout(time, callback)(hooks)
                end, {})

                useUpdateEffect(function()
                        if timeout.value == nil then
                                timeout.value = createTimeout()
                        end

                        return function()
                                if timeout.value ~= nil then
                                        timeout.value.reset()
                                end
                        end
                end, deps)(hooks)
        end
end

return useDebounce