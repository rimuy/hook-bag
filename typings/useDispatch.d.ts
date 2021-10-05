import { CoreHooks } from "@rbxts/roact-hooks";
import { Dispatch, Action } from "@rbxts/roact-hooks";

export function useDispatch<D extends Dispatch<Action<any>>>(hooks: CoreHooks): D;
export function useDispatch<A extends Action>(hooks: CoreHooks): Dispatch<A>;