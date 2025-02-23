//
//  SignUpManager.swift
//  SiliconApplication
//
//  Created by Егорио on 23.02.2025.
//

import FirebaseAuth
import FirebaseFirestore

class SignUpManager {
    static let shared = SignUpManager()
    
    private init() {}

    public func registerUser(with email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let uid = result?.user.uid else {
                completion(false, NSError(domain: "SignUpManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "User ID not found"]))
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users").document(uid).setData([
                "email": email,
                "username": "" 
            ]) { error in
                if let error = error {
                    completion(false, error)
                    return
                }
                completion(true, nil)
            }
        }
    }
}
