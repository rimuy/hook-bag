import { HookCreator } from "./";

type SetPresent<T> = (newPresent: T) => void;

export default function useUndo<T>(
        initialPresent: T,
): HookCreator<{
        set: SetPresent<T>;
        reset: SetPresent<T>;
        undo: () => void;
        redo: () => void;
        canUndo: boolean;
        canRedo: boolean;
}>;