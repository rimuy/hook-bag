local Promise = require(script.Parent.Parent.Library.Promise)

--[=[
        Handles async operations and prevents race conditions.

        ```lua
        local function fetchData()
                return Promise.new(function()
                        return httpRequest("http://url...")
                end)
        end

        local function HookedComponent(props, hooks)
                local async = useAsync(fetchData)(hooks)

                return Roact.createFragment({
                        Loading = async.isLoading and Roact.createElement(...),
                        Error = async.error and Roact.createElement(...),
                        Result = async.result and Roact.createElement(...)
                })
        end
        ```

        @function useAsync
        @within Hooks
        @tag promise
        @param asyncCallback () -> Promise<T>
        @return HookCreator<UseAsync<T>>
]=]
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