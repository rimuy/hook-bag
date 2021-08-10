import { CoreHooks } from '@rbxts/roact-hooks';
import { Store } from '@rbxts/rodux';

export default function useSelector<T, S extends (state: T) => any>(
        store: typeof Store,
        selector: S,
        hooks: CoreHooks,
        equalityFn: Callback
): T;