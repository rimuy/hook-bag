import  { CoreHooks } from "@rbxts/roact-hooks";

export type HookCreator<T> = (hooks: CoreHooks) => T;

export { default as useArray } from "./useArray";
export { default as useAsync } from "./useAsync";
export { default as useCounter } from "./useCounter";
export { default as useDebounce } from "./useDebounce";
export { default as useDebouncedText } from "./useDebouncedText";
export { default as useDispatch } from "./useDispatch";
export { default as useEvent } from "./useEvent";
export { default as useFlipper } from "./useFlipper";
export { default as useForceUpdate } from "./useForceUpdate";
export { default as useLatest } from "./useLatest";
export { default as useMaid } from "./useMaid";
export { default as usePortal } from "./usePortal";
export { default as usePrevious } from "./usePrevious";
export { default as useQueue } from "./useQueue";
export { default as useReactiveState } from "./useReactiveState";
export { default as useRendersSpy } from "./useRendersSpy";
export { default as useSelector } from "./useSelector";
export { default as useStore } from "./useStore";
export { default as useTimeout } from "./useTimeout";
export { default as useToggle } from "./useToggle";
export { default as useTween } from "./useTween";
export { default as useUndo } from "./useUndo";
export { default as useUpdateEffect } from "./useUpdateEffect";