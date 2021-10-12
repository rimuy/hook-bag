local HookConnection = require(script.Parent.Parent.HookConnection)

local roselect = require(script.Parent.Parent.Library.Roselect)
local createSelectorCreator = roselect.createSelectorCreator
local defaultMemoize = roselect.defaultMemoize

local function defaultEqualityCheck(a, b)
	return a == b
end

--[=[
	Allows you to extract data from the store state, using a selector function.

	:::warning
	Selectors should be [pure](https://en.wikipedia.org/wiki/Pure_function) since they are potentially executed multiple times and at arbitrary points in time.
	:::

	@function useSelector
	@within Hooks
	@tag roact-rodux
	@tag rodux
	@param selector (state: S) -> R
	@param equalityFn ((a: any, b: any) -> boolean) | nil
	@return HookCreator<R>
]=]
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
			local _, setState = hooks.useState(state)

			hooks.useEffect(function()
				local hookConnection = store[HookConnection]
				if hookConnection == nil then
					store[HookConnection] = {
						connection = store.changed:connect(function(newState)
							setState(newState)
						end),
						hookCount = 1,
					}
				else
					hookConnection.hookCount += 1
				end

				return function()
					if hookConnection then
						hookConnection.hookCount -= 1

						if hookConnection.hookCount == 0 then
							hookConnection.connection:disconnect()
							store[HookConnection] = nil
						end
					end
				end
			end, {})

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