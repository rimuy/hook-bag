import { HookCreator } from "./";
import { MutableValueObject } from "@rbxts/roact-hooks";

/**
 * Hook that can be used to return the latest state.
 * 
 * This is useful to get access to the latest version of a value, instead of getting the version from the time an asynchronous callback was created, for example.
 * @param value The state.
 */
declare function useLatest<T>(
        value: T
): HookCreator<MutableValueObject<T>>;

export = useLatest;