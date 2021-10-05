import { CoreHooks } from "@rbxts/roact-hooks";

export function useTimeout(
        time: number,
        callback: () => void,
): (hooks: CoreHooks) => {
        cancel: () => void;
        reset: () => void;
};

export function useTimeout(
        time: number,
        callback: () => void,
        onCancel: (timeLeft: number) => void,
): (hooks: CoreHooks) => {
        cancel: () => void;
        reset: () => void;
};