import { BasicStateAction, CoreHooks, Dispatch } from '@rbxts/roact-hooks';

type SetBoolean = (value: boolean) => void;

export default function useBoolean(
        initialValue: boolean,
        hooks: CoreHooks
): LuaTuple<[
        value: boolean,
        setTrue: SetBoolean,
        setFalse: SetBoolean,
        toggle: () => void,
        setValue: Dispatch<BasicStateAction<boolean>>,
]>;