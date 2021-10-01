import { CoreHooks } from "@rbxts/roact-hooks";

export default function useQueue<T>(
        initialValue?: Array<T>,
): (hooks: CoreHooks) => {
        add: (element: T) => void;
        remove: () => void;
        first?: T;
        last?: T;
        size: number;
};