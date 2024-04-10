//
//  BaseViewModel.swift
//  SalahUtility
//
//  Created by SalahMohamed on 10/04/2024.
//  Copyright © 2024 Salah. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public class BaseViewModel:NSObject,ObservableObject{
    private var nestedObservableObjects:[Any]=[Any]()
    public override init() {
        super.init();
    }
    func appendNested(_ element:some ObservableObject){
        let value = element.objectWillChange.sink { [weak self] (_) in
            self?.objectWillChange.send()
        }
        self.nestedObservableObjects.append(value)
    }
}
