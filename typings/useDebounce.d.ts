import { CoreHooks } from "@rbxts/roact-hooks";

export function useDebounce(
        time: number,
        callback: () => void,
): (hooks: CoreHooks) => void;

export function useDebounce(
        time: number,
        callback: () => void,
        dependencies: Array<defined>,
): (hooks: CoreHooks) => void;