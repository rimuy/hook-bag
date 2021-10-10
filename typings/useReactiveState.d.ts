import { HookCreator } from "./";

export default function useReactiveState<T extends Record<string, any>>(
        initialValue: T,
): HookCreator<T>;