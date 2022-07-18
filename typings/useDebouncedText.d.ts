import { HookCreator } from "./";

/**
 * A shortcut for using useDebounce with a string.
 * 
 * @param time The time to wait.
 * @param text The text.
 */
declare function useDebouncedText(
        time: number,
        text: string
): HookCreator<string>;

export = useDebouncedText;