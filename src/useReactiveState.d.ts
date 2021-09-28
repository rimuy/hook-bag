import { CoreHooks } from "@rbxts/roact-hooks";

export default function useReactiveState<T extends Record<string, any>>(
        initialValue: T,
): (hooks: CoreHooks) => T;