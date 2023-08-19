//
//  AppStorageView.swift
//  SalahUtilitySwiftUIExample
//
//  Created by SalahMohamed on 06/08/2023.
//  Copyright © 2023 Salah. All rights reserved.
//

import UIKit
import SwiftUI
struct AppStorageView:View{
    @AppStorage("username") var username: String?
    @StateObject var viewModel = AppStorageViewModel()
    
    var body: some View {
        VStack{
            Text(username ?? "").onAppear(){
            }
            Text($viewModel.status.wrappedValue).onAppear(){
            }
        }
    }
}
