local UserInputService = game:GetService('UserInputService')
local Roact = require(script.Parent.Import)('roact')

local Maid = require(script.Parent.Maid)
local merge = require(script.Parent.merge)

local DEFAULT_OPTIONS = {
        target = nil, -- Required
        defaultShow = true,
        displayName = 'Portal',
        displayOrder = 50000,
        ignoreGuiInset = false,
        clickOutsideToHide = false,
        onShow = function()
        end,
        onHide = function()
        end,
        onClickOutside = function(hide)
                hide()
        end,
}

local function createUsePortal(options, useCallback, useEffect, useMemo, useState, useValue)
        options = merge(DEFAULT_OPTIONS, options)

        local isShow, setShow = useState(options.defaultShow)
        local connection = useValue()

        local show = useCallback(function()
                setShow(true)
        end, {})

        local hide = useCallback(function()
                setShow(false)
        end, {})

        local toggle = useCallback(function()
                setShow(not isShow)
        end, { isShow })

        local maid = useMemo(Maid.new, {})

        local registerInput = useCallback(function()
                if connection.value == nil then
                        connection.value = UserInputService.InputBegan:Connect(function(input, processed)
                                if processed == false
                                and isShow == true
                                and input.UserInputType == Enum.UserInputType.MouseButton1 then
                                        options.onClickOutside(hide)
                                        maid:DoCleaning()
                                end
                        end)
                end
        end, { isShow })

        useEffect(function()
                if isShow == true then
                        registerInput()
                end
        end, {})

        local triggerEvent = useCallback(function()
                if isShow == true then
                        options.onShow()
                        if connection.value == nil then
                                registerInput()
                        end
                else
                        options.onHide()
                        if connection.value ~= nil then
                                connection.value:Disconnect()
                                connection.value = nil
                        end
                end
        end, { isShow })

        local Portal = useCallback(function(props)
                local portal
                if isShow == true then
                        portal = Roact.createElement(Roact.Portal, {
                                target = options.target,
                        }, {
                                [options.displayName] = Roact.createElement('ScreenGui', {
                                        DisplayOrder = options.displayOrder,
                                        IgnoreGuiInset = options.ignoreGuiInset,
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

local function usePortal(options, hooks)
        if options.target == nil then
                error('Please, provide a valid target!', 2)
        end

        return createUsePortal(
                options,
                hooks.useCallback,
                hooks.useEffect,
                hooks.useMemo,
                hooks.useState,
                hooks.useValue
        )
end

return usePortal