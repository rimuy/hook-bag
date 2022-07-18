local hooks = script.Parent:WaitForChild("Hooks")

local createUseFlipper = require(script.Parent.createUseFlipper)

local createUseDispatch = require(script.Parent.createUseDispatch)
local createUseSelector = require(script.Parent.createUseSelector)
local createUseStore = require(script.Parent.createUseStore)

local createUsePortal = require(script.Parent.createUsePortal)

local useArray = require(hooks.useArray)
local useAsync = require(hooks.useAsync)
local useCounter = require(hooks.useCounter)
local useDebounce = require(hooks.useDebounce)
local useDebouncedText = require(hooks.useDebouncedText)
local useEvent = require(hooks.useEvent)
local useForceUpdate = require(hooks.useForceUpdate)
local useLatest = require(hooks.useLatest)
local useMaid = require(hooks.useMaid)
local usePrevious = require(hooks.usePrevious)
local useQueue = require(hooks.useQueue)
local useReactiveState = require(hooks.useReactiveState)
local useRendersSpy = require(hooks.useRendersSpy)
local useTimeout = require(hooks.useTimeout)
local useToggle = require(hooks.useToggle)
local useTween = require(hooks.useTween)
local useUndo = require(hooks.useUndo)
local useUpdateEffect = require(hooks.useUpdateEffect)

local function createSource(libraries)
        local roact = libraries.roact
        if roact == nil then
                error("Roact path was not found. Are you sure the package is installed?", 2)
        end

        local useStore = createUseStore(libraries.roactRodux)
        local useSelector = createUseSelector(libraries.roselect, useStore)
        local useDispatch = createUseDispatch(useStore, useSelector)

        return {
                useArray = useArray,
                useAsync = useAsync,
                useCounter = useCounter,
                useDebounce = useDebounce,
                useDebouncedText = useDebouncedText,
                useDispatch = useDispatch,
                useEvent = useEvent,
                useFlipper = createUseFlipper(libraries.flipper),
                useForceUpdate = useForceUpdate,
                useLatest = useLatest,
                useMaid = useMaid,
                usePortal = createUsePortal(roact),
                usePrevious = usePrevious,
                useQueue = useQueue,
                useReactiveState = useReactiveState,
                useRendersSpy = useRendersSpy,
                useSelector = useSelector,
                useStore = useStore,
                useTimeout = useTimeout,
                useToggle = useToggle,
                useTween = useTween,
                useUndo = useUndo,
                useUpdateEffect = useUpdateEffect,
        }
end

return createSource