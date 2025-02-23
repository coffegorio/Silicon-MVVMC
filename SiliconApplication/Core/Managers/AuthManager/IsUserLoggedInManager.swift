//
//  IsUserLoggedInManager.swift
//  SiliconApplication
//
//  Created by Егорио on 23.02.2025.
//

import Foundation
import FirebaseAuth

class IsUserLoggedInManager {
    static let shared = IsUserLoggedInManager()
    
    private init() {}
    
    public func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
}
