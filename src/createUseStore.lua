local useStore = require(script.Parent.Hooks.useStore)

local function createUseStore(roactRoduxSource)
        local context

        if roactRoduxSource then
                context = require(roactRoduxSource.StoreContext)
        end

        return useStore(context)
end

return createUseStore