import useAsync from './useAsync';
import useBoolean from './useBoolean';
import useFlipper from './useFlipper';
import useForceUpdate from './useForceUpdate';
import useMaid from './useMaid';
import usePortal from './usePortal';
import useReactiveState from './useReactiveState';
import useRodux from './useRodux';
import useSelector from './useSelector';
import useTween from './useTween';
import useUndo from './useUndo';

declare namespace CustomHooks {
        export {
                useAsync,
                useBoolean,
                useFlipper,
                useForceUpdate,
                useMaid,
                usePortal,
                useReactiveState,
                useRodux,
                useSelector,
                useTween,
                useUndo,
        }
}

export = CustomHooks;