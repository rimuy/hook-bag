
local function createUseRodux(store, useCallback, useEffect, useState)
        local state, setState = useState(store:getState())

        useEffect(function()
                local connection = store.changed:Connect(function(newState)
                        setState(newState)
                end)
                return function()
                        connection:Disconnect()
                end
        end, {})

        local dispatch = useCallback(function(action)
                store:dispatch(action)
        end, {})

        return state, dispatch
end

local function useRodux(store)
        return function(hooks)
                return createUseRodux(
                        store,
                        hooks.useCallback,
                        hooks.useEffect,
                        hooks.useState
                )
        end
end

return useRodux