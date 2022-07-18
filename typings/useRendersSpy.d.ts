import { CoreHooks } from "@rbxts/roact-hooks";

/**
 * Returns the amount of renders the component has since its mount.
 * @param hooks The core hooks.
 */
declare function useRendersSpy(hooks: CoreHooks): number;

export = useRendersSpy;