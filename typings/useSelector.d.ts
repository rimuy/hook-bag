import { HookCreator } from "./";
import { Selector } from "@rbxts/roselect";

/**
 * Allows you to extract data from the store state, using a selector function.
 * 
 * Selectors should be [pure](https://en.wikipedia.org/wiki/Pure_function) since they are potentially executed multiple times and at arbitrary points in time.
 * @param selector The selector.
 * @param equalityFn The callback that checks to see if the previous state is equal to the new state.
 */
declare function useSelector<S, R>(
        selector: Selector<S, R>,
        equalityFn?: (a: R, b: R) => boolean,
): HookCreator<R>;

export = useSelector;