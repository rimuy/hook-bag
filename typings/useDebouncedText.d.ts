import { CoreHooks } from "@rbxts/roact-hooks";

export default function useDebouncedText(
        time: number,
        text: string
): (hooks: CoreHooks) => string;