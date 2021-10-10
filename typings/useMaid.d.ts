import { HookCreator } from "./";
import Maid from "@rbxts/maid";

export default function useMaid(
        maid: typeof Maid,
        dependencies: Array<defined>,
): HookCreator<void>;