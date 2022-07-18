import { HookCreator } from "./";

/**
 * Simply returns the previous state.
 * @param value The state.
 */
declare function usePrevious<T>(
        value: T
): HookCreator<T | undefined>;

export = usePrevious;