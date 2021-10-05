
local function useRendersSpy(hooks)
        local count = hooks.useValue(0)

        hooks.useEffect(function()
                count.value += 1
        end)

        return count.value
end

return useRendersSpy