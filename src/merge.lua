return function(...)
        local merged = table.create(select('#', ...))
        for _, v in ipairs({...}) do
                if type(v) == 'table' then
                        for _ = 1, #v do
                                table.move(v, 1, #v, 1, merged)
                        end
                        for k, val in pairs(v) do
                                merged[k] = val
                        end
                        continue
                end
                table.insert(merged, v)
        end
        return merged
end