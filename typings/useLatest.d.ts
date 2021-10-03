import { CoreHooks, MutableValueObject } from "@rbxts/roact-hooks";

export default function useLatest<T>(
        value: T
): (hooks: CoreHooks) => MutableValueObject<T>;