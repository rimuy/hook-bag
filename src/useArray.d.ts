import { CoreHooks, Dispatch, BasicStateAction } from "@rbxts/roact-hooks";

export default function useArray<T>(
        value: Array<T>,
): (hooks: CoreHooks) => {
        array: Array<T>;
        set: Dispatch<BasicStateAction<T>>;
        push: (...elements: Array<T>) => void;
        filter: (callback: (element: T, index: number) => boolean) => void;
        update: (index: number, element: T) => void;
        remove: (index: number) => void;
        clear: () => void;
};