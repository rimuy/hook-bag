import { HookCreator } from ".";

interface SignalWithConnect {
        Connect(callback: Callback): { Disconnect(): void } | { Destroy(): void };
}

interface SignalWithCamelConnect {
        connect(callback: Callback): { disconnect(): void } | { destroy(): void };
}

interface SignalWithOn {
        on(callback: Callback): { disconnect(): void } | { destroy(): void };
}

type SignalLike = SignalWithConnect | SignalWithCamelConnect | SignalWithOn;

type InferSignalCallback<S extends SignalLike> = Parameters<
        S extends SignalWithConnect
                ? S["Connect"]
                : S extends SignalWithCamelConnect
                ? S["connect"]
                : S extends SignalWithOn
                ? S["on"]
                : never
>[0];

/**
 * Memoizes and connects a signal object to a callback listener.
 * @param signal The signal object.
 * @param onEvent The callback to execute when the event is fired.
 */
declare function useEvent<E extends SignalLike>(
        signal: E,
        onEvent: InferSignalCallback<E>,
): HookCreator<void>;

/**
 * Memoizes and connects a signal object to a callback listener.
 * @param signal The signal object.
 * @param onEvent The callback to execute when the event is fired.
 * @param dependencies The dependencies.
 */
declare function useEvent<E extends SignalLike>(
        signal: E,
        onEvent: InferSignalCallback<E>,
        dependencies?: Array<any>
): HookCreator<void>;

export = useEvent;