
local function useUpdateEffect(callback, deps)
        return function(hooks)
                local firstRender = hooks.useValue(true)

                hooks.useEffect(function()
                        if firstRender.value then
                                firstRender.value = false
                                return
                        end

                        return callback()
                end, deps)
        end
end

return useUpdateEffect