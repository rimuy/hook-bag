import { HookCreator } from "./";

export default function usePrevious<T>(
        value: T
): HookCreator<T | undefined>;