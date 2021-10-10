local Promise = require(script.Parent.Parent.Library.Promise)

local function noop() end

--[=[
        Re-renders the component after a specified number of seconds.
        Provides handles to cancel and/or reset the timeout.

        :::info
        This is a one time call. Once the timeout is finished, you cannot use it again.
        If you are looking into something that can change accordingly to its dependencies, check [useDebounce](#useDebounce).
        :::

        ```lua
        local function HookedComponent(props, hooks)
                local text, setText = useState("")
                local timeout = useTimeout(3, function()
                        setText("This took 3 seconds!")
                end)(hooks)

                return Roact.createElement("TextLabel", {
                        -- ...
                        Text = text,
                })
        end
        ```

        @function useTimeout
        @within Hooks
        @tag promise
        @param time number
        @param callback () -> void
        @param onCancel ((timeLeft: number) -> void) | nil
        @return HookCreator<UseTimeout>
]=]
local function useTimeout(time, callback, onCancel)
        return function(hooks)
                local createTimeout = hooks.useCallback(function()
                        return Promise.delay(time):andThen(function(resolve)
                                task.spawn(function()
                                        callback()
                                end)
                                resolve()
                        end):catch(noop)
                end, {})

                local now = hooks.useValue(os.time())
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