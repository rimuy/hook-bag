
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