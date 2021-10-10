local copy = require(script.Parent.Parent.copy)

--[=[
        State hook that implements a simple FIFO queue.

        @function useQueue
        @within Hooks
        @param initialValue {T}
        @return HookCreator<UseQueue<T>>
]=]
local function useQueue(initialValue)
        return function(hooks)
                local queue, setQueue = hooks.useState(initialValue or {})
                local size = #queue

                local function memoized(callback)
                        return hooks.useCallback(function(...)
                                setQueue(callback(...))
                        end, { queue })
                end

                local add = memoized(function(element)
                        local newQueue = copy(queue)
                        table.insert(newQueue, 1, element)

                        return newQueue
                end)

                local remove = memoized(function()
                        local newQueue = copy(queue)
                        table.remove(newQueue, 1)

                        return newQueue
                end)

                return {
                        add = add,
                        remove = remove,
                        first = queue[1],
                        last = queue[size],
                        size = size,
                }
        end
end

return useQueue