import { CoreHooks } from '@rbxts/roact-hooks';

export default function useAsync(
        asyncCallback: (...args: any[]) => Promise<unknown>,
        hooks: CoreHooks
): {
        loading: boolean;
        error?: string;
        result?: string;
        cancel?: boolean;
};