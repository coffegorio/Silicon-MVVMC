//
//  SignInManager.swift
//  SiliconApplication
//
//  Created by Егорио on 22.02.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class SignInManager {
    
    static let shared = SignInManager()
    
    private init() {}
    
    public func signInUser(with userRequest: SignInUserRequest, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let user = result?.user else {
                completion(.failure(NSError(domain: "SignInManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected error: User not found"])))
                return
            }

            completion(.success(user))
        }
    }
}
