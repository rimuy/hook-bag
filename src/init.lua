local createSource = require(script.createSource)

--- @class Hooks

--- @type HookCreator<T> (hooks: RoactHooks) -> T
--- @within Hooks

--- @interface PortalOptions
--- @within Hooks
--- .Target Instance
--- .DefaultShow boolean | nil
--- .DisplayName string | nil
--- .DisplayOrder number | nil
--- .IgnoreGuiInset boolean | nil
--- .OnShow (() -> void) | nil
--- .OnHide (() -> void) | nil
--- .OnClickOutside ((hide: () -> void) -> void) | nil

--- @interface UseArray<T>
--- @within Hooks
--- .array {T}
--- .set (valueOrCallback: T | (array: T) -> T) -> void
--- .push (...elements: T) -> void
--- .filter (callback: (element: T, index: number) -> boolean) -> void
--- .update (index: number, element: T) -> void
--- .remove (index: number) -> void
--- .clear () -> void

--- @interface UseAsync<T>
--- @within Hooks
--- .isLoading boolean
--- .isCancelled boolean
--- .error T | nil
--- .result T | nil

--- @type UseCounter (number, () -> void, () -> void, () -> void)
--- @within Hooks

--- @type UseFlipper (RoactBinding<number>, FlipperMotor)
--- @within Hooks

--- @interface UsePortal
--- @within Hooks
--- .Portal Roact.FunctionComponent
--- .isShow boolean
--- .show () -> void
--- .hide () -> void
--- .toggle () -> void

--- @interface UseQueue<T>
--- @within Hooks
--- .add (element: T) -> void
--- .remove () -> void
--- .first T | nil
--- .last T | nil
--- .size number

--- @interface UseTimeout
--- @within Hooks
--- .cancel () -> void
--- .reset () -> void

--- @type UseToggle (boolean, (value: boolean | nil) -> void)
--- @within Hooks

--- @interface UseTween
--- @within Hooks
--- .play () -> void
--- .pause () -> void
--- .cancel () -> void
--- .onCompleted (callback: (playbackState: Enum.PlaybackState) -> void) -> void

--- @interface UseUndo<T>
--- @within Hooks
--- .set (newPresent: T) -> void
--- .reset (newPresent: T) -> void
--- .undo () -> void
--- .redo () -> void
--- .canUndo boolean
--- .canRedo boolean

--- @interface UseUndoState<T>
--- @within Hooks
--- .past {T}
--- .present T
--- .future {T}

local roactSource = script.Parent.Roact
local roactRoduxSource = script.Parent.RoactRodux

return createSource(roactSource, roactRoduxSource)