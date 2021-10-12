local merge = require(script.Parent.Parent.merge)

local UNDO_ACTION = "UNDO"
local REDO_ACTION = "REDO"
local SET_ACTION = "SET"
local RESET_ACTION = "RESET"

local INITIAL_STATE = {
        past = {},
        future = {},
}

local function reducer(state, action)
        local past = state.past
        local present = state.present
        local future = state.future

        if action.type == UNDO_ACTION then
                if #past == 0 then
                        return state
                end

                local previous = past[#past]
                local newPast = table.create(#past - 1)

                for i = 1, #past - 1 do
                        table.insert(newPast, past[i])
                end

                local newFuture = table.create(#future + 1)
                table.insert(newFuture, present)

                for _, f in ipairs(future) do
                        table.insert(newFuture, f)
                end

                return {
                        past = newPast,
                        present = previous,
                        future = newFuture,
                }
        elseif action.type == REDO_ACTION then
                if #future == 0 then
                        return state
                end

                local nextValue = future[1]
                local newFuture = table.create(#future - 1)

                for i = 2, #future do
                        table.insert(newFuture, future[i])
                end

                local newPast = table.create(#past + 1)
                for _, p in ipairs(past) do
                        table.insert(newPast, p)
                end

                table.insert(newPast, present)

                return {
                        past = newPast,
                        present = nextValue,
                        future = newFuture,
                }
        elseif action.type == SET_ACTION then
                local newPresent = action.newPresent

                if newPresent == present then
                        return state
                end

                local newPast = table.create(#past + 1)
                for _, p in ipairs(past) do
                        table.insert(newPast, p)
                end

                table.insert(newPast, present)

                return {
                        past = newPast,
                        present = newPresent,
                        future = {},
                }
        elseif action.type == RESET_ACTION then
                return merge(INITIAL_STATE, { present = action.newPresent })
        end
end

--[=[
        Stores defined amount of previous state values and provides handles to travel through them.

        > TODO EXAMPLE

        @function useUndo
        @within Hooks
        @param initialPresent T
        @return HookCreator<(UseUndoState<T>, UseUndo<T>)>
]=]
local function useUndo(initialPresent)
        return function(hooks)
                local state, dispatch = hooks.useReducer(reducer, merge(
                        INITIAL_STATE,
                        { present = initialPresent }
                ))

                return hooks.useMemo(function()
                        local function undo()
                                dispatch({ type = UNDO_ACTION })
                        end

                        local function redo()
                                dispatch({ type = REDO_ACTION })
                        end

                        local function set(newPresent)
                                dispatch({
                                        type = SET_ACTION,
                                        newPresent = newPresent,
                                })
                        end

                        local function reset(newPresent)
                                dispatch({
                                        type = RESET_ACTION,
                                        newPresent = newPresent,
                                })
                        end

                        return state, {
                                set = set,
                                reset = reset,
                                undo = undo,
                                redo = redo,
                                canUndo = #state.past > 0,
                                canRedo = #state.future > 0,
                        }
                end, { state.past, state.future })
        end
end

return useUndo