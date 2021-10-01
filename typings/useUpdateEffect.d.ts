import { CoreHooks } from "@rbxts/roact-hooks";

export default function useUpdateEffect(
        callback: () => (() => void) | void,
        dependencies?: any[],
): (hooks: CoreHooks) => void;