local copy = require(script.Parent.Parent.copy)
local useLatest = require(script.Parent.useLatest)

--[=[
        Creates a mutable state object that causes a re-render whenever a new value is assigned to a key.

        @function useReactiveState
        @within Hooks
        @param initialState T
        @return HookCreator<T>
]=]
local function useReactiveState(initialState)
        return function(hooks)
                if type(initialState) ~= "table" then
                        error("Initial state is not a table!", 2)
                end

                local state, update = hooks.useState(initialState)
                local latestState = useLatest(state)(hooks)

                local reactiveState = hooks.useMemo(function()
                        return setmetatable({}, {
                                __index = function(_, key)
                                        return latestState.value[key]
                                end,
                                __newindex = function(_, key, value)
                                        local newState = copy(latestState.value)
                                        newState[key] = value
                                        update(newState)
                                end,
                                __tostring = function()
                                        return 'ReactiveState'
                                end,
                        })
                end, {})

                return reactiveState
        end
end

return useReactiveState