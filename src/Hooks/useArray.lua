local copy = require(script.Parent.Parent.copy)

--[=[
        Lets you manipulate an array data structure without ever needing extra utilities.

        ```lua
        local function HookedComponent(props, hooks)
                local text = hooks.useValue()
                local list = useArray({})(hooks)

                return Roact.createFragment({
                        Button = Roact.createElement("TextButton", {
                                -- ...
                                Text = "Add",
                                [Roact.Event.MouseButton1Click] = function(rbx)
                                        if text.value then
                                                list.push(text.value)
                                        end
                                        text.value = nil
                                end
                        }),
                        TextBox = Roact.createElement("TextBox", {
                                -- ...
                                Text = "",
                                [Roact.Change.Text] = function(rbx)
                                        text.value = rbx.Text
                                end
                        }),
                        Display = Roact.createElement("Frame", {
                                -- ...
                        }, {
                                Layout = Roact.createElement("UIListLayout", {
                                        -- ...
                                }),
                                Roact.createFragment(list.array)
                        })
                })
        end
        ```

        @function useArray
        @within Hooks
        @param initialValue {T} | nil
        @return HookCreator<UseArray<T>>
]=]
local function useArray(initialValue)
        return function(hooks)
                local array, setArray = hooks.useState(initialValue)

                local newArray = hooks.useCallback(function(callback)
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
end

return useArray