local copy = require(script.Parent.Parent.copy)

local function useReactiveState(initialState)
        return function(hooks)
                if type(initialState) ~= "table" then
                        error("Initial state is not a table!", 2)
                end

                local state, update = hooks.useState(initialState)

                return setmetatable({}, {
                        __index = function(_, key)
                                return state[key]
                        end,
                        __newindex = function(_, key, value)
                                local newState = copy(state)
                                newState[key] = value
                                update(newState)
                        end,
                        __tostring = function()
                                return 'ReactiveState'
                        end,
                })
        end
end

return useReactiveState