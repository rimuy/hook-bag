
--[=[
        Returns the amount of renders the component has since its mount.

        @function useRendersSpy
        @within Hooks
        @param hooks RoactHooks
        @return number
]=]
local function useRendersSpy(hooks)
        local count = hooks.useValue(0)

        hooks.useEffect(function()
                count.value += 1
        end)

        return count.value
end

return useRendersSpy