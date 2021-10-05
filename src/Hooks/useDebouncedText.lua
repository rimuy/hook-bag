local useDebounce = require(script.Parent.useDebounce)
local useLatest = require(script.Parent.useLatest)

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