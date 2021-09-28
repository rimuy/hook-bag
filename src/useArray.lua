local copy = require(script.Parent.copy)

local function createUseArray(initialValue, useCallback, useState)
        local array, setArray = useState(initialValue)

                local newArray = useCallback(function(callback)
                        setArray(function(a)
                                return callback(copy(a))
                        end)
                end, { array })

                local function push(...)
                        local elements = table.create(select("#", ...), {...})

                        newArray(function(arr)
                                for _, e in pairs(elements) do
                                        table.insert(arr, e)
                                end

                                return arr
                        end)
                end

                local function filter(callback)
                        newArray(function(arr)
                                for i, v in pairs(arr) do
                                        local assertion = callback(v, i)
                                        assert(type(assertion) == "boolean")

                                        if assertion == false then
                                                table.remove(arr, i)
                                        end
                                end

                                return arr
                        end)
                end

                local function update(index, e)
                        newArray(function(arr)
                                arr[index] = e

                                return arr
                        end)
                end

                local function remove(index)
                        setArray(function(arr)
                                table.remove(arr, index)

                                return arr
                        end)
                end

                local function clear()
                        setArray({})
                end

                return {
                        array = array,
                        set = setArray,
                        push = push,
                        filter = filter,
                        update = update,
                        remove = remove,
                        clear = clear,
                }
end

local function useArray(initialValue)
        return function(hooks)
                return createUseArray(
                        initialValue,
                        hooks.useCallback,
                        hooks.useState
                )
        end
end

return useArray