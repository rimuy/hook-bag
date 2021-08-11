import { Binding } from '@rbxts/roact';
import { CoreHooks } from '@rbxts/roact-hooks';

export default function useTween(
        tweenInfo: TweenInfo,
): (hooks: CoreHooks) => LuaTuple<[Binding<number>, {
        Play: () => void;
        Pause: () => void;
        Cancel: () => void;
        OnCompleted: <S extends Tween['Completed']>(
                callback: S extends RBXScriptSignal<infer F> ? F : never
        ) => void;
}]>;