import { HookCreator } from "./";

/**
 * Creates a mutable state object that causes a re-render whenever a new value is assigned to a key.
 * @param initialValue The initial state.
 */
declare function useReactiveState<T extends Record<string, any>>(
        initialValue: T,
): HookCreator<T>;

export = useReactiveState;