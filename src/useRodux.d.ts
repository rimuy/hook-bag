import { CoreHooks } from '@rbxts/roact-hooks';
import { Dispatch, Action, AnyAction } from '@rbxts/roact-hooks';
import { Store } from '@rbxts/rodux';

export default function useRodux<S, A extends Action = AnyAction>(
        store: typeof Store,
): (hooks: CoreHooks) => LuaTuple<[state: S, dispatch: Dispatch<A>]>;