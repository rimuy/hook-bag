import Roact from '@rbxts/roact';
import { HookCreator } from "./";

interface UsePortalOptions {
        Target: Instance;
        DefaultShow?: boolean;
        DisplayName?: string;
        DisplayOrder?: number;
        IgnoreGuiInset?: boolean;
        OnShow?: () => void;
        OnHide?: () => void;
        OnClickOutside?: (hide: () => void) => void;
}

/**
 * This helps you render children into an element that exists outside the hierarchy of the parent component.
 * @param options The settings of the portal.
 */
declare function usePortal(
        options: UsePortalOptions
): HookCreator<{
        Portal: () => Roact.Element;
        isShow: boolean;
        show: () => void;
        hide: () => void;
        toggle: () => void;
}>;

export = usePortal;