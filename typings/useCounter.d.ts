import { HookCreator } from "./";

export default function useCounter(
        initialValue?: number
): HookCreator<
        LuaTuple<[
                count: number,
                increment: () => number,
                decrement: () => number,
                reset: () => void,
        ]>
>;