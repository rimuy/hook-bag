import { HookCreator } from "./";

/**
 * State hook that tracks a numeric value.
 * If no initial value is passed, it will default to 0.
 * 
 * Counters can be increased/decreased by amount if you pass a number to it's function.
 * @param initialValue The initial value.
 */
declare function useCounter(
        initialValue?: number
): HookCreator<
        LuaTuple<[
                count: number,
                increment: () => number,
                decrement: () => number,
                reset: () => void,
        ]>
>;

export = useCounter;