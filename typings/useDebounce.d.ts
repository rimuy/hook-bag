import { CoreHooks } from "@rbxts/roact-hooks";

export default function useDebounce(
        time: number,
        callback: () => void,
        dependencies?: Array<any>,
): (hooks: CoreHooks) => void;