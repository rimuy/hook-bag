
--[=[
        Hook that can be used to return the latest state.

        :::tip
        This is useful to get access to the latest version of a value, instead of getting the version from the time an asynchronous callback was created, for example.
        :::

        ```lua
        local function Demo(props, hooks)
                local count, increment = useCounter()(hooks)
                local latestCount = useLatest(count)(hooks)

                useTimeout(5, function()
                        print(("Latest count is: %s"):format(latestCount.value))
                end)(hooks)

                return Roact.createFragment({
                        Label = Roact.createElement(Label, {
                                Text = tostring(count)
                        }),
                        Button = Roact.createElement(Button, {
                                OnClick = function()
                                        increment()
                                end
                        })
                })
        end
        ```

        @function useLatest
        @within Hooks
        @param value T
        @return HookCreator<{ value: T }>
]=]
local function useLatest(value)
        return function(hooks)
                local latest = hooks.useValue(value)

                hooks.useEffect(function()
                        latest.value = value
                end, { value })

                return latest
        end
end

return useLatest