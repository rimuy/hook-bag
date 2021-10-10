import { Binding } from "@rbxts/roact";
import { HookCreator } from "./";
import BaseMotor from "@rbxts/flipper/typings/BaseMotor";

export default function useFlipper<T extends BaseMotor<number | Array<number>>>(
        motor: T,
): HookCreator<LuaTuple<[Binding<number>, T]>>;