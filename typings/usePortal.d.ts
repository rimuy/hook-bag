import { HookCreator } from "./";
import Roact from '@rbxts/roact';

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

export default function usePortal(
        options: UsePortalOptions
): HookCreator<{
        Portal: Roact.FunctionComponent;
        isShow: boolean;
        show: () => void;
        hide: () => void;
        toggle: () => void;
}>;