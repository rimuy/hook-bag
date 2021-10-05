import { CoreHooks } from "@rbxts/roact-hooks";
import { Selector } from "@rbxts/roselect";

export default function useSelector<S, R>(
        selector: Selector<S, R>,
        equalityFn?: (a: unknown, b: unknown) => boolean,
): (hooks: CoreHooks) => R;