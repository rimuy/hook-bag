import { Binding } from "@rbxts/roact";
import { CoreHooks } from "@rbxts/roact-hooks";

export default function useTween(
        tweenInfo: TweenInfo,
): (hooks: CoreHooks) => LuaTuple<[Binding<number>, {
        play: () => void;
        pause: () => void;
        cancel: () => void;
        onCompleted: <S extends Tween["Completed"]>(
                callback: S extends RBXScriptSignal<infer F> ? F : never
        ) => void;
}]>;