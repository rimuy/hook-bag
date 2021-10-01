import { CoreHooks } from "@rbxts/roact-hooks";

export default function useCounter(
        initialValue?: number
): (hooks: CoreHooks) => LuaTuple<[
        count: number,
        increment: () => number,
        decrement: () => number,
        reset: () => void,
]>;