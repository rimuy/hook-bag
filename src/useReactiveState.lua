
local function useReactiveState(initialState, hooks)
        if type(initialState) ~= 'table' then
                error('Initial state is not a table!', 2)
        end

        local state, update = hooks.useState(initialState)

        return setmetatable({}, {
                __index = function(_, key)
                        return state[key]
                end,
                __newindex = function(_, key, value)
                        state[key] = value
                        update(state)
                end,
                __tostring = function()
                        return 'ReactiveState'
                end,
        })
end

return useReactiveState