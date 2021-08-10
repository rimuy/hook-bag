import { Binding } from '@rbxts/roact';
import { CoreHooks } from '@rbxts/roact-hooks';
import { SingleMotor, GroupMotor } from '@rbxts/flipper';

type FlipperMotor<T = never> = T extends never ? SingleMotor : GroupMotor<T>

export default function useFlipper<T>(
        motor: FlipperMotor<T>,
        hooks: CoreHooks
): LuaTuple<[Binding<number>, FlipperMotor<T>]>;