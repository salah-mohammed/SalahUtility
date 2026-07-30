//
//  AppStorageViewModel.swift
//  SalahUtilitySwiftUIExample
//
//  Created by SalahMohamed on 06/08/2023.
//  Copyright © 2023 Salah. All rights reserved.
//

import UIKit
import SwiftUI
import Foundation
import Combine

class AppStorageViewModel:NSObject,ObservableObject{
    @Published var status: String = UserDefaults.standard.status {
         didSet {
             UserDefaults.standard.status = status
         }
     }

     private var cancelable:AnyCancellable?
    override init() {
        super.init()
         cancelable = UserDefaults.standard.publisher(for: \.status)
            .sink(receiveValue: { newValue in
                                 if newValue != self.status { // avoid cycling !!
                                     self.status = newValue
                                 }
            })
     }
    
}

extension UserDefaults {
    @objc dynamic var status: String {
        get { string(forKey: "username") ?? "username" }
        set { setValue(newValue, forKey: "username") }
    }
}
