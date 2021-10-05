local HookConnection = require(script.Parent.Parent.HookConnection)

local storeKeys = {"_state", "_reducer", "_connections"}

local function isStore(store)
        if type(store) ~= "table" then
                return false
        end

        for _, v in ipairs(storeKeys) do
                if not store[v] then
                        return false
                end
        end

        return true
end

local function useStore(context)
        return function(hooks)
                if context == nil then
                        error("Roact-Rodux path was not found. Are you sure that package is installed?", 2)
                end

                local store = hooks.useContext(context)

                if store == nil then
                        error("A store value must be passed into the StoreProvider.", 3)
                elseif not isStore(store) then
                        error("An invalid store was passed into the StoreProvider.", 3)
                end

                local _, setState = hooks.useState(store:getState())

                hooks.useEffect(function()
                        if store[HookConnection] == nil then
                                store[HookConnection] = store.changed:connect(function(newState)
                                        setState(newState)
                                end)
                        end

                        return function()
                                local connection = store[HookConnection]
                                if connection then
                                        connection:Disconnect()
                                        store[HookConnection] = nil
                                end
                        end
                end, {})

                return store
        end
end

return useStore