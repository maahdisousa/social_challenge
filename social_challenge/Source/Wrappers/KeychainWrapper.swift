//
//  KeychainWrapper.swift
//  social_challenge
//
//  Created by Thiago Henrique on 17/08/22.
//

import Foundation

struct KeychainWrapper {
    static let shared = KeychainWrapper()
    private let server = Constants.baseUrl
    
    func saveData(account: String, dataToSave: Data) throws {
        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                    kSecAttrAccount as String: account,
                                    kSecAttrServer as String: server,
                                    kSecValueData as String: dataToSave]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
    }
    
    func getData() throws -> Data {
        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                    kSecAttrServer as String: server,
                                    kSecMatchLimit as String: kSecMatchLimitOne,
                                    kSecReturnAttributes as String: true,
                                    kSecReturnData as String: true]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status != errSecItemNotFound else { throw KeychainError.noData }
        guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
        
        guard let existingItem = item as? [String : Any],
            let searchedData = existingItem[kSecValueData as String] as? Data
        else {
            throw KeychainError.unhandledError(status: status)
        }
        
        return searchedData
    }
    
    func deleteData() throws {
        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                    kSecAttrServer as String: server]
        
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else { throw KeychainError.unhandledError(status: status) }
    }
}

enum KeychainError: Error {
    case noData
    case unexpectedData
    case unhandledError(status: OSStatus)
}
