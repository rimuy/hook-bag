import { CoreHooks } from "@rbxts/roact-hooks";

export default function useToggle(
        initialValue: boolean,
): (hooks: CoreHooks) => LuaTuple<[
        value: boolean,
        toggle: (value?: boolean) => void,
]>;