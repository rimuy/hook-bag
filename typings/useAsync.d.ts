import { HookCreator } from "./";

/**
 * Handles async operations and prevents race conditions.
 * @param asyncCallback The callback that will return a promise.
 */
declare function useAsync<T>(
        asyncCallback: (...args: any[]) => Promise<T>,
): HookCreator<{
        isLoading: boolean;
        isCancelled?: boolean;
        error?: T;
        result?: T;
}>;

export = useAsync;