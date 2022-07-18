import { HookCreator } from "./";

/**
 * State hook that implements a simple FIFO queue.
 * @param initialValue The initial value of the queue.
 */
declare function useQueue<T>(
        initialValue?: Array<T>,
): HookCreator<{
        add: (element: T) => void;
        remove: () => void;
        first?: T;
        last?: T;
        size: number;
}>;

export = useQueue;