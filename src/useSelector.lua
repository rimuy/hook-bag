local roselect = require(script.Parent.roselect)
local createSelectorCreator = roselect.createSelectorCreator
local defaultMemoize = roselect.defaultMemoize

local function defaultEqualityCheck(a, b)
	return a == b
end

local function useSelector(store, selector, hooks, equalityFn)
	if not equalityFn then
		equalityFn = defaultEqualityCheck
	end

	local checkEqual = hooks.useMemo(function()
		if not equalityFn then
			equalityFn = defaultEqualityCheck
		end
		return equalityFn
	end, { equalityFn })

	local state = store:getState()
	local result = hooks.useMemo(function()
		return createSelectorCreator(
			defaultMemoize,
			checkEqual
		)(
			function()
				return state
			end,
			selector
		)
	end, { state })

	return result
end

return useSelector