import { HookCreator } from "./";

/**
 * Hook that delays invoking a function until after wait seconds have elapsed since the last time the debounced function was invoked.
 * The third argument is the array of values that the debounce depends on, in the same manner as `useEffect`.
 * The debounce timeout will start when one of the values changes.
 * @param time The amount of seconds to wait.
 * @param callback The callback to execute once the timer is completed without interruptions. 
 */
declare function useDebounce(
        time: number,
        callback: () => void,
): HookCreator<void>;

/**
 * Hook that delays invoking a function until after wait seconds have elapsed since the last time the debounced function was invoked.
 * The third argument is the array of values that the debounce depends on, in the same manner as `useEffect`.
 * The debounce timeout will start when one of the values changes.
 * @param time The amount of seconds to wait.
 * @param callback The callback to execute once the timer is completed without interruptions.
 * @param dependencies The dependencies.
 */
declare function useDebounce(
        time: number,
        callback: () => void,
        dependencies?: Array<defined>,
): HookCreator<void>;

export = useDebounce;