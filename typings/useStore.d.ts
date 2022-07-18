import { CoreHooks } from "@rbxts/roact-hooks";
import { Store as RoduxStore } from "@rbxts/rodux";

type Store<S> = Omit<RoduxStore<S>, "dispatch">;

/**
 * Returns a reference to the same store that was passed in to the `StoreProvider` component.
 * 
 * This **should not** be used frequently.
 * If you just want to retrieve data from the store, prefer [useSelector](#useSelector) instead.
 * @param hooks The core hooks.
 */
declare function useStore<S>(hooks: CoreHooks): Store<S>;

export = useStore;