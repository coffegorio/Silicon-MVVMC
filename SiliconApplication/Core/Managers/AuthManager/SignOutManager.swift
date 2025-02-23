//
//  SignOutManager.swift
//  SiliconApplication
//
//  Created by Егорио on 23.02.2025.
//

import Foundation
import FirebaseAuth

class SignOutManager {
    static let shared = SignOutManager()
    
    private init() {}
    
    public func signOut(completion: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
}

