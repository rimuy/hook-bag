
--[=[
        Does the exactly same thing `useEffect` do, but ignores the first render.

        @function useUpdateEffect
        @within Hooks
        @param callback () -> (() -> void) | void
        @param dependencies {any} | nil
        @return HookCreator<void>
]=]
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