import { HookCreator } from "./";

type SetPresent<T> = (newPresent: T) => void;

interface State<T> {
        past: Array<T>;
        present: T;
        future: Array<T>;
}

export default function useUndo<T extends defined>(
        initialPresent: T,
): HookCreator<LuaTuple<[
        State<T>,
        {
                set: SetPresent<T>;
                reset: SetPresent<T>;
                undo: () => void;
                redo: () => void;
                canUndo: boolean;
                canRedo: boolean;
        }
]>>;