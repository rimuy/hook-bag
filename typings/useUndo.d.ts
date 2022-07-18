import { HookCreator } from "./";

type SetPresent<T> = (newPresent: T) => void;

interface State<T> {
        past: Array<T>;
        present: T;
        future: Array<T>;
}

/**
 * Stores defined amount of previous state values and provides handles to travel through them.
 * @param initialPresent The initial value.
 */
declare function useUndo<T extends defined>(
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

export = useUndo;