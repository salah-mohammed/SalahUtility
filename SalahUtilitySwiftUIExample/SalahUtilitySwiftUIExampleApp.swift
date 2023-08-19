//
//  SalahUtilitySwiftUIExampleApp.swift
//  SalahUtilitySwiftUIExample
//
//  Created by SalahMohamed on 19/02/2023.
//  Copyright © 2023 Salah. All rights reserved.
//

import SwiftUI

@main
struct SalahUtilitySwiftUIExampleApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentListView()
            }
        }
    }
    init() {
        DispatchQueue.main.asyncAfter(deadline:.now()+10){
            UserDefaults.standard.set("9", forKey:"username")
            UserDefaults.standard.synchronize();
        }
    }
}
