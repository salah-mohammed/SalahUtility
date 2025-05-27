//
//  LocalAuth.swift
//  LMS
//
//  Created by Salah on 8/9/20.
//  Copyright © 2020 t4edu. All rights reserved.
//

import Foundation
import LocalAuthentication

public class LocalAuth: NSObject {
    public static let shared = LocalAuth()

    override private init() {}

    public var laContext = LAContext()

    public func canAuthenticate() -> Bool {
        var error: NSError?
        let hasTouchId = self.laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        return hasTouchId
    }

    public func hasTouchId() -> Bool {
        if self.canAuthenticate() && self.laContext.biometryType == .touchID {
            return true
        }
        return false
    }

    public func hasFaceId() -> Bool {
        if self.canAuthenticate() && self.laContext.biometryType == .faceID {
            return true
        }
        return false
    }
    public func hasFaceIdOrTouchId()->Bool{
        return self.hasFaceId() || self.hasTouchId()
    }
    public func auth(
           localizedReason: String,
           completion: @escaping (_ success: Bool, _ error: Error?) -> Void
       ) {
           DispatchQueue.main.async {
               var authError: NSError?

               if  self.laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                   self.laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: localizedReason) { success, error in
                       DispatchQueue.main.async {
                           completion(success, error)
                       }
                   }
               } else {
                   DispatchQueue.main.async {
                       completion(false, authError)
                   }
               }
           }
    }
}
