import { CoreHooks } from "@rbxts/roact-hooks";

import useArray from "./useArray";
import useAsync from "./useAsync";
import useCounter from "./useCounter";
import { useDebounce } from "./useDebounce";
import useDebouncedText from "./useDebouncedText";
import { useDispatch } from "./useDispatch";
import useFlipper from "./useFlipper";
import useForceUpdate from "./useForceUpdate";
import useLatest from "./useLatest";
import useMaid from "./useMaid";
import usePortal from "./usePortal";
import usePrevious from "./usePrevious";
import useQueue from "./useQueue";
import useReactiveState from "./useReactiveState";
import useRendersSpy from "./useRendersSpy";
import useSelector from "./useSelector";
import useStore from "./useStore";
import { useTimeout } from "./useTimeout";
import useToggle from "./useToggle";
import useTween from "./useTween";
import useUndo from "./useUndo";
import { useUpdateEffect } from "./useUpdateEffect";

declare namespace CustomHooks {
        export {
                useArray,
                useAsync,
                useCounter,
                useDebounce,
                useDebouncedText,
                useDispatch,
                useFlipper,
                useForceUpdate,
                useLatest,
                useMaid,
                usePortal,
                usePrevious,
                useQueue,
                useReactiveState,
                useRendersSpy,
                useSelector,
                useStore,
                useTimeout,
                useToggle,
                useTween,
                useUndo,
                useUpdateEffect,
        }
}

declare namespace CustomHooks {
        export type HookCreator<T> = (hooks: CoreHooks) => T;
}

export = CustomHooks;