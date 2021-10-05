local Maid = require(script.Parent.Parent.Library.Maid)
local merge = require(script.Parent.Parent.merge)

local DEFAULT_OPTIONS = {
        Target = nil, -- Required!
        DefaultShow = true,
        DisplayName = "Portal",
        DisplayOrder = 50000,
        IgnoreGuiInset = false,
        OnShow = function()
        end,
        OnHide = function()
        end,
        OnClickOutside = function(hide)
                hide()
        end,
}

local function usePortal(Roact)
        return function(options)
                return function(hooks)
                        if Roact == nil then
                                error("Roact path was not found. Are you sure that package is installed?", 2)
                        end

                        if options.Target == nil then
                                error("Please, provide a valid target!", 3)
                        end

                        options = merge(DEFAULT_OPTIONS, options)

                        local isShow, setShow = hooks.useState(options.DefaultShow)
                        local connection = hooks.useValue()

                        local show = hooks.useCallback(function()
                                setShow(true)
                        end, {})

                        local hide = hooks.useCallback(function()
                                setShow(false)
                        end, {})

                        local toggle = hooks.useCallback(function()
                                setShow(not isShow)
                        end, { isShow })

                        local maid = hooks.useMemo(Maid.new, {})

                        local registerInput = hooks.useCallback(function()
                                if connection.value == nil then
                                        connection.value = hooks.userInputService.InputBegan:Connect(function(input, processed)
                                                if processed == false
                                                and isShow == true
                                                and input.hooks.userInputType == Enum.hooks.userInputType.Mohooks.useButton1 then
                                                        options.OnClickOutside(hide)
                                                        maid:DoCleaning()
                                                end
                                        end)
                                end
                        end, { isShow })

                        hooks.useEffect(function()
                                if isShow == true then
                                        registerInput()
                                end
                        end, {})

                        local triggerEvent = hooks.useCallback(function()
                                if isShow == true then
                                        options.OnShow()
                                        if connection.value == nil then
                                                registerInput()
                                        end
                                else
                                        options.OnHide()
                                        if connection.value ~= nil then
                                                connection.value:Disconnect()
                                                connection.value = nil
                                        end
                                end
                        end, { isShow })

                        local Portal = hooks.useCallback(function(props)
                                local portal
                                if isShow == true then
                                        portal = Roact.createElement(Roact.Portal, {
                                                target = options.Target,
                                        }, {
                                                [options.DisplayName] = Roact.createElement("ScreenGui", {
                                                        DisplayOrder = options.DisplayOrder,
                                                        IgnoreGuiInset = options.IgnoreGuiInset,
                                                }, props[Roact.Children])
                                        })
                                end

                                triggerEvent()

                                return Roact.createFragment({ portal })
                        end, { isShow })

                        return {
                                Portal = Portal,
                                isShow = isShow,
                                show = show,
                                hide = hide,
                                toggle = toggle,
                        }
                end
        end
end

return usePortal