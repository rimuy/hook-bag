local roselect = require(script.Parent.Parent.Library.Roselect)
local createSelectorCreator = roselect.createSelectorCreator
local defaultMemoize = roselect.defaultMemoize

local function defaultEqualityCheck(a, b)
	return a == b
end

local function useSelector(useStore)
	return function(selector, equalityFn)
		return function(hooks)
			local checkEqual = hooks.useMemo(function()
				if not equalityFn then
					equalityFn = defaultEqualityCheck
				end
				return equalityFn
			end, { equalityFn })

			local store = useStore(hooks)
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
				)()
			end, { state })

			return result
		end
	end
end

return useSelector