import { Binding } from "@rbxts/roact";
import { HookCreator } from "./";
import BaseMotor from "@rbxts/flipper/typings/BaseMotor";

/**
 * Helper hook that takes a flipper motor, connects it to a binding and returns both.
 * @param motor The flipper motor.
 */
declare function useFlipper<T extends BaseMotor<number | Array<number>>>(
        motor: T,
): HookCreator<LuaTuple<[Binding<number>, T]>>;

export = useFlipper;