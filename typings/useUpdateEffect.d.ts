import { HookCreator } from "./";

/**
 * Does the exactly same thing `useEffect` do, but ignores the first render.
 * @param callback The callback to execute.
 */
declare function useUpdateEffect(
        callback: () => (() => void) | void,
): HookCreator<void>;

/**
 * Does the exactly same thing `useEffect` do, but ignores the first render.
 * @param callback The callback to execute.
 * @param dependencies The dependencies.
 */
declare function useUpdateEffect(
        callback: () => (() => void) | void,
        dependencies?: Array<any>,
): HookCreator<void>;

export = useUpdateEffect;