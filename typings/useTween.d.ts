import { Binding } from "@rbxts/roact";
import { HookCreator } from "./";

export default function useTween(
        tweenInfo: TweenInfo,
): HookCreator<
        LuaTuple<[Binding<number>, {
                play: () => void;
                pause: () => void;
                cancel: () => void;
                onCompleted: <S extends Tween["Completed"]>(
                        callback: S extends RBXScriptSignal<infer F> ? F : never
                ) => void;
        }]>
>;