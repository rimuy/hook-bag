import { HookCreator } from "./";

/**
 * State hook that tracks value of a boolean.
 * @param initialValue The initial value.
 */
declare function useToggle(
        initialValue: boolean,
): HookCreator<
        LuaTuple<[
                value: boolean,
                toggle: (value?: boolean) => void,
        ]>
>;

export = useToggle;