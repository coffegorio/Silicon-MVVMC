//
//  UserDefaultsManager.swift
//  SiliconApplication
//
//  Created by Егорио on 23.02.2025.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    func saveUsername(username: String) {
        UserDefaults.standard.set(username, forKey: "username")
    }
    
    func getUsername() -> String? {
        return UserDefaults.standard.string(forKey: "username")
    }
    
    func removeUsername() {
        UserDefaults.standard.removeObject(forKey: "username")
    }
}
