//
//  VibrationViewModel.swift
//  SalahUtilitySwiftUIExample
//
//  Created by SalahMohamed on 26/07/2023.
//  Copyright © 2023 Salah. All rights reserved.
//
import Foundation
import SalahUtility
class VibrationViewModel:NSObject,ObservableObject{
    @Published  var adLoaded = false
    @Published  var list:[(String,Action)] = []
    override init() {
        super.init();
        list.append(("error",{
            Vibration.error.vibrate()
        }))
        list.append(("success",{
            Vibration.success.vibrate()
        }))
        list.append(("warning",{
            Vibration.warning.vibrate()
        }))
        list.append(("light",{
            Vibration.light.vibrate()
        }))
        list.append(("medium",{
            Vibration.medium.vibrate()
        }))
        list.append(("heavy",{
            Vibration.heavy.vibrate()
        }))
        list.append(("soft",{
            Vibration.soft.vibrate()
        }))
        list.append(("rigid",{
            Vibration.rigid.vibrate()
        }))
        list.append(("selection",{
            Vibration.selection.vibrate()
        }))
        list.append(("oldSchool",{
            Vibration.oldSchool.vibrate()
        }))
    }
    func action()->Action{
        let action:Action = {
        };
        return action;
    }
    
}
