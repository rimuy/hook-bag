local Flipper = require(script.Parent.Parent.import)("Flipper")
local AssignedBinding = require(script.Parent.Parent.AssignedBinding)

--[=[
	Helper hook that takes a flipper motor, connects it to a binding and returns both.

	@function useFlipper
	@within Hooks
	@tag flipper
	@param motor FlipperMotor
	@return HookCreator<UseFlipper>
]=]
local function useFlipper(motor)
	return function(hooks)
        	local isMotor = Flipper.isMotor(motor)
		if not isMotor then
			error("Provided value is not a motor!", 2)
		end

		local m = hooks.useValue(motor)
		local binding, setBindingValue = hooks.useBinding(m.value:getValue())

		hooks.useEffect(function()
			local currentMotor = m.value
			currentMotor:onStep(setBindingValue)

			return function()
				currentMotor:destroy()
			end
		end, { m.value })

		return binding, m.value
	end
end

return useFlipper