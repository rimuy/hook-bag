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

--[=[
        Returns a reference to the same store that was passed in to the `StoreProvider` component.

        :::caution
        This **should not** be used frequently.
        If you just want to retrieve data from the store, prefer [useSelector](#useSelector) instead.
        :::

        @function useStore
        @within Hooks
        @tag roact-rodux
        @tag rodux
        @param hooks RoactHooks
        @return Store
]=]
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

                return store
        end
end

return useStore