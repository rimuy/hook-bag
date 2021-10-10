import { HookCreator } from "./";
import { MutableValueObject } from "@rbxts/roact-hooks";

export default function useLatest<T>(
        value: T
): HookCreator<MutableValueObject<T>>;