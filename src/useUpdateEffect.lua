
local function createUseUpdateEffect(useEffect, useValue, callback, deps)
        local firstRender = useValue(true)

        useEffect(function()
                if firstRender.value then
                        firstRender.value = false
                        return
                end

                return callback()
        end, deps)
end

local function useUpdateEffect(callback, dependencies)
        return function(hooks)
                createUseUpdateEffect(
                        hooks.useEffect, hooks.useValue,
                        callback, dependencies
                )
        end
end

return useUpdateEffect