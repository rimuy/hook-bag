import { HookCreator } from "./";

export function useUpdateEffect(
        callback: () => (() => void) | void,
): HookCreator<void>;

export function useUpdateEffect(
        callback: () => (() => void) | void,
        dependencies: Array<any>,
): HookCreator<void>;