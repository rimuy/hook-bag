local Promise = require(script.Parent.Promise)

local function useTimeout(time, callback, onCancel)
        return function(hooks)
                local now = hooks.useValue(os.time())
                local timeout = hooks.useValue(
                        Promise.delay(time):andThen(function(resolve)
                                task.spawn(function()
                                        callback()
                                end)
                                resolve()
                        end):catch(function() end))

                local cancel = hooks.useCallback(function()
                        if timeout.value.Status == "Started" then
                                timeout.value:cancel()
                                if onCancel then
                                        onCancel(os.time() - now)
                                end
                        end
                end, {})

                return cancel
        end
end

return useTimeout