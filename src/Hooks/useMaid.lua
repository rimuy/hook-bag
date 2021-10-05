local Maid = require(script.Parent.Parent.Library.Maid)

local function useMaid(maid, deps)
        return function(hooks)
                if Maid.isMaid(maid) == false then
                        error("Value is not a maid!", 2)
                end

                if deps then
                        if type(deps) ~= "table" then
                                error("Dependency list must be a table.", 2)

                        elseif #deps == 0 then
                                error("Dependency list should not be empty.", 2)
                        end
                end

                local firstRender = hooks.useValue(true)

                hooks.useEffect(function()
                        if firstRender.value == true then
                                firstRender.value = false
                        else
                                maid:DoCleaning()
                        end
                end, deps)
        end
end

return useMaid