import { CoreHooks } from "@rbxts/roact-hooks";

/**
 * Returns a callback that once called, will cause the component to re-render.
 * @param hooks The core hooks.
 */
declare function useForceUpdate(hooks: CoreHooks): () => void;

export = useForceUpdate;