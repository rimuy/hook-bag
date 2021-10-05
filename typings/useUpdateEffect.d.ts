import { CoreHooks } from "@rbxts/roact-hooks";

export function useUpdateEffect(
        callback: () => (() => void) | void,
): (hooks: CoreHooks) => void;

export function useUpdateEffect(
        callback: () => (() => void) | void,
        dependencies: Array<any>,
): (hooks: CoreHooks) => void;