local useDebounce = require(script.Parent.useDebounce)
local useLatest = require(script.Parent.useLatest)

--[=[
        A shortcut for using [useDebounce](#useDebounce) with a string.

        ```lua
        local function HookedComponent(props, hooks)
                local text, setText = hooks.useState("")
                local debouncedText = useDebouncedText(1, text)(hooks)

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

        @function useDebouncedText
        @within Hooks
        @tag promise
        @param time number
        @param text string
        @return HookCreator<string>
]=]
local function useDebouncedText(time, text)
        return function(hooks)
                local debouncedText, setDebouncedText = hooks.useState(text)
                local latestText = useLatest(text)(hooks)

                useDebounce(time, function()
                        setDebouncedText(latestText.value)
                end, { text })(hooks)

                return debouncedText
        end
end

return useDebouncedText