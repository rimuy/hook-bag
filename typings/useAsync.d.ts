import { HookCreator } from "./";

export default function useAsync<T>(
        asyncCallback: (...args: any[]) => Promise<T>,
): HookCreator<{
        isLoading: boolean;
        isCancelled?: boolean;
        didError?: boolean;
        result?: T;
}>;