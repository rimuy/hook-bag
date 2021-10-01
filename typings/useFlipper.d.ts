import { Binding } from "@rbxts/roact";
import { CoreHooks } from "@rbxts/roact-hooks";

export default function useFlipper<T>(
        motor: T,
): (hooks: CoreHooks) => LuaTuple<[Binding<number>, T]>;