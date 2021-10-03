import { CoreHooks } from "@rbxts/roact-hooks";

export default function useTimeout(
        time: number,
        callback: () => void,
        onCancel?: (timeLeft: number) => void,
): (hooks: CoreHooks) => void;