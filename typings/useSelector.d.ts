import { HookCreator } from "./";
import { Selector } from "@rbxts/roselect";

export default function useSelector<S, R>(
        selector: Selector<S, R>,
        equalityFn?: (a: R, b: R) => boolean,
): HookCreator<R>;