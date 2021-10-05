import { CoreHooks } from "@rbxts/roact-hooks";
import { Store as RoduxStore } from "@rbxts/rodux";

type Store<S> = Omit<RoduxStore<S>, "dispatch">;

export default function useStore<S>(hooks: CoreHooks): Store<S>;