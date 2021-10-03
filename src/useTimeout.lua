local Promise = require(script.Parent.Promise)

local function useTimeout(time, callback, onCancel)
        return function(hooks)
                local now = hooks.useValue(os.time())

                local createTimeout = hooks.useCallback(function()
                        return Promise.delay(time):andThen(function(resolve)
                                task.spawn(function()
                                        callback()
                                end)
                                resolve()
                        end):catch(function() end)
                end, {})

                local timeout = hooks.useValue(createTimeout())

                local cancel = hooks.useCallback(function()
                        if timeout.value:getStatus() == "Started" then
                                timeout.value:cancel()
                                if onCancel then
                                        onCancel(os.time() - now.value)
                                end
                        end
                end, { timeout.value })

                local reset = hooks.useCallback(function()
                        cancel()
                        timeout.value = createTimeout()
                end, {})

                return {
                        cancel = cancel,
                        reset = reset,
                }
        end
end

return useTimeout