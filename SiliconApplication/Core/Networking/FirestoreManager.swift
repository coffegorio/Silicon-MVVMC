//
//  FirestoreManager.swift
//  SiliconApplication
//
//  Created by Егорио on 23.02.2025.
//

import FirebaseFirestore
import FirebaseAuth

class FirestoreManager {
    
    static let shared = FirestoreManager()
    
    private let db = Firestore.firestore()
    
    private init() {}
    
    // Обновление имени пользователя
    func updateUserName(_ userName: String, completion: @escaping (Bool, Error?) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(false, NSError(domain: "FirestoreManager", code: 401, userInfo: [NSLocalizedDescriptionKey: "User is not logged in"]))
            return
        }
        
        let userRef = db.collection("users").document(user.uid)
        
        userRef.updateData(["userName": userName]) { error in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
    
    // Получение данных пользователя и создание UserModel
    func getUser(completion: @escaping (UserModel?, Error?) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(nil, NSError(domain: "FirestoreManager", code: 401, userInfo: [NSLocalizedDescriptionKey: "User is not logged in"]))
            return
        }
        
        let userRef = db.collection("users").document(user.uid)
        
        userRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let email = user.email ?? "" // email извлекаем из FirebaseAuth
                let userName = document.get("userName") as? String
                
                let userModel = UserModel(userId: user.uid, email: email, userName: userName)
                completion(userModel, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}

