import { Dispatch, BasicStateAction } from "@rbxts/roact-hooks";
import { HookCreator } from "./";

/**
 * Lets you manipulate an array data structure without ever needing extra utilities.
 * @param value The initial state of the array.
 */
declare function useArray<T>(
        value: Array<T>,
): HookCreator<{
        array: Array<T>;
        set: Dispatch<BasicStateAction<T>>;
        push: (...elements: Array<T>) => void;
        filter: (callback: (element: T, index: number) => boolean) => void;
        update: (index: number, element: T) => void;
        remove: (index: number) => void;
        clear: () => void;
}>;

export = useArray;