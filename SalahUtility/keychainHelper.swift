//
//  keychainHelper.swift
//  SalahUtility
//
//  Created by SalahMohamed on 25/01/2024.
//  Copyright © 2024 Salah. All rights reserved.
//

import Security

public class keychainHelper: NSObject {
    @discardableResult public static func saveNumberToKeychain(_ number: NSNumber, forKey key: String) -> OSStatus {
        let data = NSKeyedArchiver.archivedData(withRootObject: number)

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        // Delete any existing item with the same key
        SecItemDelete(query as CFDictionary)

        // Add the new item to the keychain
        let status = SecItemAdd(query as CFDictionary, nil)

        return status
    }

    public static func getNumberFromKeychain(forKey key: String) -> NSNumber? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess {
            if let data = dataTypeRef as? Data,
               let retrievedNumber = NSKeyedUnarchiver.unarchiveObject(with: data) as? NSNumber {
                return retrievedNumber
            } else {
                // Failed to convert data to NSNumber
                return nil
            }
        } else {
            return nil
        }
    }
    @discardableResult public static func saveStringToKeychain(_ value: String, forKey key: String) -> OSStatus {
        if let data = value.data(using: .utf8) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecValueData as String: data
            ]

            // Delete any existing item with the same key
            SecItemDelete(query as CFDictionary)

            // Add the new item to the keychain
            let status = SecItemAdd(query as CFDictionary, nil)

            return status
        } else {
            // Failed to convert string to data
            return errSecParam
        }
    }

     public static func getStringFromKeychain(forKey key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess {
            if let data = dataTypeRef as? Data,
               let retrievedString = String(data: data, encoding: .utf8) {
                return retrievedString
            } else {
                // Failed to convert data to string
                return nil
            }
        } else {
            return nil
        }
    }
    @discardableResult public static func deleteKeyFromKeychain(key: String)->OSStatus{
        // Define the search query dictionary
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "YourServiceName", // Replace with your service name
            kSecAttrAccount as String: key
        ]

        // Delete the key from the Keychain
        let status = SecItemDelete(query as CFDictionary)

        if status == errSecSuccess {
            print("Key successfully deleted from the Keychain.")
        } else {
            print("Error deleting key from the Keychain. Status code: \(status)")
        }
        return status;
    }

}
