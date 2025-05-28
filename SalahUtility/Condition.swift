//
//  Condition.swift
//  SalahUtility
//
//  Created by SalahMohamed on 30/03/2023.
//  Copyright © 2023 Salah. All rights reserved.
//

import Foundation

public protocol ConditionProtocol{
    /* if result of check == false check fail if check == true the check is success  */
    var check:Bool{get}
    /* The goal of operation function when failure action accure will implemented or this depend on your condition*/
    func operation()
    var subConditions:[ConditionProtocol]{get}
}
public extension ConditionProtocol{
    func checkWithOperation(){
    let check = self.check
    if check{
        self.operation()
    }
    }
}
public extension Array where Element == ConditionProtocol {
   @discardableResult func checkWithOperation(){
        for item in self{
           item.checkWithOperation()
            for subcondition in item.subConditions{
            subcondition.checkWithOperation()
            }
        }
    }
}


