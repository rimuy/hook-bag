import { HookCreator } from "./";

export default function useToggle(
        initialValue: boolean,
): HookCreator<
        LuaTuple<[
                value: boolean,
                toggle: (value?: boolean) => void,
        ]>
>;