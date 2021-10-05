import { CoreHooks } from "@rbxts/roact-hooks";

export default function useAsync<T>(
        asyncCallback: (...args: any[]) => Promise<T>,
): (hooks: CoreHooks) => {
        isLoading: boolean;
        isCancelled?: boolean;
        didError?: boolean;
        result?: T;
};