//
//  ContentListViewModel.swift
//  SwiftUtilitySwiftUIExample
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
    @Published  var pushAppStorage:Bool=false;
    @Published  var fileManagementSystem:Bool=false;
    @Published  var dateManagementSystem:Bool=false;

    
    override init() {
        super.init();
        list.append(("Vibration",{
            self.pushVibration=true;
        }))
        list.append(("App Storage",{
            self.pushAppStorage=true;
        }))
        list.append(("File Management System",{
            self.fileManagementSystem=true;
        }))
        list.append(("Date Management System",{
            self.dateManagementSystem=true;
        }))
       
    }
}
