import { HookCreator } from "./";

export default function useDebouncedText(
        time: number,
        text: string
): HookCreator<string>;