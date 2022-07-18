import { Binding } from "@rbxts/roact";
import { HookCreator } from "./";

/**
 * Takes a TweenInfo class and returns a binding and an object to manage the tweening.
 * @param tweenInfo The [TweenInfo](https://create.roblox.com/docs/reference/engine/datatypes/TweenInfo) instance.
 */
declare function useTween(
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

export = useTween;