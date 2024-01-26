//
//  KeychainExampleViewController.swift
//  SalahUtilityExample
//
//  Created by SalahMohamed on 25/01/2024.
//  Copyright © 2024 Salah. All rights reserved.
//

import UIKit
import SalahUtility
class KeychainExampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Example usage for strings:
        let stringToSave = "YourString"
        let key = "YourKey"
        let saveStatus = keychainHelper.saveStringToKeychain(stringToSave, forKey: key)
        
        if saveStatus == errSecSuccess {
            print("String saved to keychain successfully")
        } else {
            print("Failed to save string to keychain with status \(saveStatus)")
        }
        
        if let retrievedString = keychainHelper.getStringFromKeychain(forKey: key) {
            print("Retrieved string from keychain: \(retrievedString)")
        } else {
            print("Failed to retrieve string from keychain")
        }
        
    
        // Example usage NSNumber:
        let numberToSave = NSNumber(value: 42)
        let key2 = "YourKey"

        let saveStatus2 = keychainHelper.saveNumberToKeychain(numberToSave, forKey: key2)

        if saveStatus2 == errSecSuccess {
            print("Number saved to keychain successfully")
        } else {
            print("Failed to save number to keychain with status \(saveStatus)")
        }

        if let retrievedNumber = keychainHelper.getNumberFromKeychain(forKey: key2) {
            print("Retrieved number from keychain: \(retrievedNumber)")
        } else {
            print("Failed to retrieve number from keychain")
        }
    }

}
