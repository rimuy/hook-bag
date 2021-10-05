local Promise = require(script.Parent.Parent.Library.Promise)

local function useAsync(asyncCallback)
        return function(hooks)
                local promise = hooks.useMemo(asyncCallback, {})

                if Promise.is(promise) == false then
                        error("Value is not an async function!", 2)
                end

                local result, update = hooks.useState({ loading = true })

                hooks.useEffect(function()
                        task.spawn(function()
                                local status, value = promise:awaitStatus()
                                update({
                                        isLoading = false,
                                        isCancelled = status == Promise.Status.Cancelled,
                                        didError = status == Promise.Status.Rejected,
                                        result = value,
                                })
                        end)
                end, {})

                return result
        end
end

return useAsync