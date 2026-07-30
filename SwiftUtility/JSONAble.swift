//
//  JSONAble.swift
//  SwiftUtility
//
//  Created by Salah on 11/29/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import Foundation

public protocol JSONAble {}

public extension JSONAble {
    func bs_dict() -> [String:Any] {
        var dict = [String:Any]()
        let otherSelf = Mirror(reflecting: self)
        for child in otherSelf.children {
            if let key = child.label {
                dict[key] = child.value
            }
        }
        return dict
    }
}
//
//class JsonRequest : JSONAble {
//    var param1 : String?
//    // ...
//}
