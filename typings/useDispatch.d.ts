import { CoreHooks, Dispatch, Action } from "@rbxts/roact-hooks";

/**
 * Returns a function that executes the `dispatch` method of the store.
 * You may use it to dispatch actions as needed.
 * @param hooks The core hooks.
 */
declare function useDispatch<D extends Dispatch<Action<any>>>(hooks: CoreHooks): D;
declare function useDispatch<A extends Action>(hooks: CoreHooks): Dispatch<A>;

export = useDispatch;