local TweenService = game:GetService("TweenService")

local function useTween(tweenInfo)
        return function(hooks)
                local binding, setBinding = hooks.useBinding(0)
                local onCompletedConnection = hooks.useValue()
                local numberValue = hooks.useMemo(function()
                        return Instance.new("NumberValue")
                end, {})

                local tween = TweenService:Create(numberValue, tweenInfo, { Value = 1 })

                hooks.useEffect(function()
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

                local play = hooks.useCallback(function()
                        tween:Play()
                end, {})

                local pause = hooks.useCallback(function()
                        tween:Pause()
                end, {})

                local cancel = hooks.useCallback(function()
                        tween:Cancel()
                        numberValue.Value = 0
                end, {})

                local onCompleted = hooks.useCallback(function(callback)
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
end

return useTween