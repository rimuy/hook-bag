local TweenService = game:GetService("TweenService")

local function createUseTween(numberValue, tween, useBinding, useCallback, useEffect, useValue)
        local binding, setBinding = useBinding(0)
        local onCompletedConnection = useValue()

        useEffect(function()
                local connection = numberValue:GetPropertyChangedSignal("Value"):Connect(function()
                        setBinding(numberValue.Value)
                end)

                return function()
                        connection:Disconnect()
                        local conn = onCompletedConnection.value

                        if conn ~= nil then
                                onCompletedConnection.value = nil
                                conn:Disconnect()
                        end

                        numberValue:Destroy()
                end
        end, {})

        local play = useCallback(function()
                tween:Play()
        end, {})

        local pause = useCallback(function()
                tween:Pause()
        end, {})

        local cancel = useCallback(function()
                tween:Cancel()
                numberValue.Value = 0
        end, {})

        local onCompleted = useCallback(function(callback)
                if type(callback) ~= "function" then
                        error("Callback parameter is not a function!", 3)
                end

                onCompletedConnection.value = tween.Completed:Connect(callback)
        end, {})

        return binding, {
                play = play,
                pause = pause,
                cancel = cancel,
                onCompleted = onCompleted,
        }
end

local function useTween(tweenInfo)
        return function(hooks)
                local numberValue = hooks.useMemo(function()
                        return Instance.new("NumberValue")
                end, {})

                local tween = TweenService:Create(numberValue, tweenInfo, { Value = 1 })

                return createUseTween(
                        numberValue, tween,
                        hooks.useBinding, hooks.useCallback,
                        hooks.useEffect, hooks.useValue
                )
        end
end

return useTween