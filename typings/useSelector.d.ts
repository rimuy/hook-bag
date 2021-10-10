import { HookCreator } from "./";
import { Selector } from "@rbxts/roselect";

export default function useSelector<S, R>(
        selector: Selector<S, R>,
        equalityFn?: (a: unknown, b: unknown) => boolean,
): HookCreator<R>;