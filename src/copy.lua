local function copy(tbl)
        local newTbl = {}
        for k, v in pairs(tbl) do
                newTbl[k] = v
        end

        return newTbl
end

return copy