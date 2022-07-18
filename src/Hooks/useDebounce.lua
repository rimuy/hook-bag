local useTimeout = require(script.Parent.useTimeout)
local useUpdateEffect = require(script.Parent.useUpdateEffect)

--[=[
        Hook that delays invoking a function until after wait seconds have elapsed since the last time the debounced function was invoked.

        The third argument is the array of values that the debounce depends on, in the same manner as `useEffect`.
        The debounce timeout will start when one of the values changes.

        :::tip
        You can reach the same result using the hook [below](#useDebouncedText).
        :::

        ```lua
        local function HookedComponent(props, hooks)
                local text, setText = hooks.useState("")
                local debouncedText, setDebouncedText = hooks.useState(text)

                -- Will change debouncedText and render after 1 second of inactivity
                useDebounce(1, function()
                        setDebouncedText(text)
                end, { text })(hooks)

                return Roact.createFragment({
                        Label = Roact.createElement(Label, {
                                Text = debouncedText
                        }),
                        Box = Roact.createElement("TextBox", {
                                -- ...,
                                [Roact.Change.Text] = function(rbx)
                                        setText(rbx.Text)
                                end
                        }),
                })
        end
        ```

        @function useDebounce
        @within Hooks
        @tag promise
        @param time number
        @param callback () -> void
        @param dependencies {any}
        @return HookCreator<(() -> boolean, () -> void)>
]=]
local function useDebounce(time, callback, deps)
        return function(hooks)
                local isCancelled = hooks.useValue(false)
                local isReady = hooks.useValue(false)
                local timeout = hooks.useValue()
                local createTimeout = hooks.useCallback(function()
                        return useTimeout(time, callback, function()
                                isCancelled.value = true
                                isReady.value = false
                        end)(hooks)
                end, {})

                local cancel = hooks.useMemo(function()
                        return timeout.value and timeout.value.cancel
                end, { timeout.value })

                local isReadyFn = hooks.useCallback(function()
                        return isReady.value
                end, { isReady.value })

                useUpdateEffect(function()
                        if timeout.value == nil or isCancelled.value then
                                timeout.value = createTimeout()
                        end
                        isReady.value = true

                        return function()
                                if timeout.value ~= nil then
                                        timeout.value.reset()
                                end
                                isReady.value = false
                        end
                end, deps)(hooks)

                return isReadyFn, cancel
        end
end

return useDebounce