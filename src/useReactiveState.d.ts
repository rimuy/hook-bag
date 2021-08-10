import { CoreHooks } from '@rbxts/roact-hooks';

export default function useReactiveState<T extends {
        [x: string]: any;
        [x: number]: any;
}>(
        initialValue: T,
        hooks: CoreHooks
): T;