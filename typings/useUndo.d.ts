import { CoreHooks } from "@rbxts/roact-hooks";

type SetPresent<T> = (newPresent: T) => void;

export default function useUndo<T>(
        initialPresent: T,
): (hooks: CoreHooks) => {
        set: SetPresent<T>;
        reset: SetPresent<T>;
        undo: () => void;
        redo: () => void;
        canUndo: boolean;
        canRedo: boolean;
};