//
//  ContentListViewModel.swift
//  SalahUtilitySwiftUIExample
//
//  Created by SalahMohamed on 26/07/2023.
//  Copyright © 2023 Salah. All rights reserved.
//
import Foundation

typealias Action = ()->Void
class ContentListViewModel:NSObject,ObservableObject{
    @Published  var adLoaded = false
    @Published  var list:[(String,Action)] = []
    @Published  var pushVibration:Bool=false;
    override init() {
        super.init();
        list.append(("Vibration",{
            self.pushVibration=true;
        }))
    }
}
