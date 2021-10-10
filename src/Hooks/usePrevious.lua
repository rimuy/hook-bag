
--[=[
        Simply returns the previous state.

        @function usePrevious
        @within Hooks
        @param state S
        @return HookCreator<S>
]=]
local function usePrevious(state)
        return function(hooks)
                local currentValue = hooks.useValue(state)
                local previousValue = hooks.useValue()

                if currentValue.value ~= state then
                        previousValue.value = currentValue.value
                        currentValue.value = state
                end

                return previousValue.value
        end
end

return usePrevious