import { HookCreator } from "./";
import Maid from "@rbxts/maid";

/**
 * Will clear the maid after one of its dependencies change.
 * @param maid The maid instance.
 * @param dependencies The dependencies.
 */
declare function useMaid(
        maid: typeof Maid,
        dependencies: Array<any>,
): HookCreator<void>;

export = useMaid;