local function defaultEqualityCheck(a, b)
	return a == b
end

local function isDependency(value)
	return type(value) ~= 'function'
	and type(value) == 'table' and value['dependencies'] == nil
end

local function reduce(tbl, callback, initialValue)
        tbl = tbl or {}
	local value = initialValue or tbl[1]

	for i, v in ipairs(tbl) do
		value = callback(value, v, i)
	end

	return value
end

local function areArgumentsShallowlyEqual(equalityCheck, prev, nextValue)
	if prev == nil or nextValue == nil or #prev ~= #nextValue then
		return false
	end

	for i = 1, #prev do
		if equalityCheck(prev[i], nextValue[i]) == false then
			return false
		end
	end

	return true
end

function defaultMemoize(func, equalityCheck)
	if equalityCheck == nil then
		equalityCheck = defaultEqualityCheck
	end

	local lastArgs
	local lastResult

	return function(...)
		local args = {...}

		if areArgumentsShallowlyEqual(equalityCheck, lastArgs, args) == false then
			lastResult = func(unpack(args))
		end

		lastArgs = args
		return lastResult
	end
end

local function getDependencies(funcs)
	local dependencies = isDependency(funcs[1]) and funcs[1] or funcs

	for _, dep in ipairs(dependencies) do
		if isDependency(dep) then
			error('Selector creators expect all input-selectors to be functions.', 2)
		end
	end

	return dependencies
end

function createSelectorCreator(memoize, ...)
	local memoizeOptions = {...}

	return function(...)
		local funcs = {...}

		local recomputations = 0
		local resultFunc = table.remove(funcs, #funcs)
		local dependencies = getDependencies(funcs)

		local memoizedResultFunc = memoize(
			function(...)
				recomputations += 1
				return resultFunc(...)
			end,
			unpack(memoizeOptions)
		)

		local selector = setmetatable({
			resultFunc = resultFunc,
			dependencies = dependencies,
			recomputations = function()
				return recomputations
			end,
			resetRecomputations = function()
				recomputations = 0
				return recomputations
			end
		}, {
			__call = memoize(function(self, ...)
				local params = {}

				for i = 1, #dependencies do
					table.insert(params, dependencies[i](...))
				end

				return memoizedResultFunc(unpack(params))
			end)
		})

		return selector
	end
end

local createSelector = createSelectorCreator(defaultMemoize)

function createStructuredSelector(selectors, selectorCreator)
	if type(selectors) ~= 'table' then
		local errMsg = 'createStructuredSelector expects first argument to be an object where each property is a selector, instead received a %s'
		error((errMsg):format(type(selectors)), 2)
	elseif selectorCreator == nil then
		selectorCreator = createSelector
	end

	local keys = {}
	for key, _ in pairs(selectors) do
		table.insert(keys, key)
	end

	local funcs = table.create(#keys)
	for _, key in ipairs(keys) do
		table.insert(funcs, selectors[key])
	end

	return selectorCreator(
		funcs,
		function(...)
			return reduce({...}, function(composition, value, index)
				composition[keys[index]] = value
				return composition
			end)
		end
	)
end

return {
	defaultMemoize = defaultMemoize,
	reduce = reduce,
	createSelectorCreator = createSelectorCreator,
	createSelector = createSelector,
	createStructuredSelector = createStructuredSelector,
}