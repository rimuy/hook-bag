import { HookCreator } from "./";

interface UseTimeout {
        cancel: () => void;
        reset: () => void;
}

/**
 * Re-renders the component after a specified number of seconds.
 * Provides handles to cancel and/or reset the timeout.
 * @param time The amount of seconds.
 * @param callback The callback to execute.
 */
declare function useTimeout(
        time: number,
        callback: () => void,
): HookCreator<UseTimeout>;

/**
 * Re-renders the component after a specified number of seconds.
 * Provides handles to cancel and/or reset the timeout.
 * @param time The amount of seconds.
 * @param callback The callback to execute.
 * @param onCancel The callback that executes when it's cancelled.
 */
declare function useTimeout(
        time: number,
        callback: () => void,
        onCancel: (timeLeft: number) => void,
): HookCreator<UseTimeout>;

export = useTimeout;