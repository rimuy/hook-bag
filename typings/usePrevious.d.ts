import { CoreHooks } from "@rbxts/roact-hooks";

export default function usePrevious<T>(
        value: T
): (hooks: CoreHooks) => T | undefined;