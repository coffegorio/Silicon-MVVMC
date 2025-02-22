//
//  UserManager.swift
//  SiliconApplication
//
//  Created by Егорио on 22.02.2025.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    
    private let key = "userModel"
    
    var user: UserModel {
        didSet {
            saveUser()
        }
    }
    
    private init() {
        if let data = UserDefaults.standard.data(forKey: key),
           let savedUser = try? JSONDecoder().decode(UserModel.self, from: data) {
            self.user = savedUser
        } else {
            self.user = UserModel(username: "", email: "")
        }
    }
    
    private func saveUser() {
        if let data = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
