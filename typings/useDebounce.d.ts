import { HookCreator } from "./";

export function useDebounce(
        time: number,
        callback: () => void,
): HookCreator<void>;

export function useDebounce(
        time: number,
        callback: () => void,
        dependencies: Array<defined>,
): HookCreator<void>;