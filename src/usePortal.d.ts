import { CoreHooks } from '@rbxts/roact-hooks';
import { Element } from '@rbxts/roact';

interface Options {
        target: Instance;
        defaultShow?: boolean;
        displayName?: string;
        displayOrder?: number;
        ignoreGuiInset?: boolean;
        clickOutsideToHide?: boolean;
        onShow?: () => void;
        onHide?: () => void;
        onClickOutside?: (hide: () => void) => void;
}

export default function usePortal(
        options: Options,
        hooks: CoreHooks
): {
        Portal: Element;
        isShow: boolean;
        show: () => void;
        hide: () => void;
        toggle: () => void;
};