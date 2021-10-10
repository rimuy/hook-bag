import { HookCreator } from "./";

export function useTimeout(
        time: number,
        callback: () => void,
): HookCreator<{
        cancel: () => void;
        reset: () => void;
}>;

export function useTimeout(
        time: number,
        callback: () => void,
        onCancel: (timeLeft: number) => void,
): HookCreator<{
        cancel: () => void;
        reset: () => void;
}>;