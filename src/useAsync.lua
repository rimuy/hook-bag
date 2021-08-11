local Promise = require(script.Parent.Promise)

local function createUseAsync(promise, useEffect, useState)
        if Promise.is(promise) == false then
                error('Value is not an async function!', 2)
        end

        local result, update = useState({ loading = true })

        useEffect(function()
                task.spawn(function()
                        local status, value = promise:awaitStatus()
                        update({
                                loading = false,
                                error = status == Promise.Status.Rejected and value,
                                result = status == Promise.Status.Resolved and value,
                                cancel = status == Promise.Status.Cancelled,
                        })
                end)
        end, {})

        return result
end

local function useAsync(asyncCallback)
        return function(hooks)
                local promise = hooks.useMemo(asyncCallback, {})
                return createUseAsync(
                        promise,
                        hooks.useEffect,
                        hooks.useState
                )
        end
end

return useAsync