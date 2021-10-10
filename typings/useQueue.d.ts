import { HookCreator } from "./";

export default function useQueue<T>(
        initialValue?: Array<T>,
): HookCreator<{
        add: (element: T) => void;
        remove: () => void;
        first?: T;
        last?: T;
        size: number;
}>;