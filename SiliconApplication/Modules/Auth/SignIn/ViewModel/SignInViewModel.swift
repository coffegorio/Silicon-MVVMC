//
//  SignInViewModel.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import Foundation
import FirebaseAuth

class SignInViewModel: ObservableObject {
    @Published var isLoading = false
    
    private weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator?) {
        self.coordinator = coordinator
    }
    
    func showSignUp() {
        coordinator?.showSignUpView()
    }
    
    func showResetPassword() {
        coordinator?.showResetPassword()
    }
    
    func showMainAuth() {
        coordinator?.start()
    }
    
    func finishAuth(email: String, password: String) {
        isLoading = true
        let userRequest = SignInUserRequest(email: email, password: password)
        
        SignInManager.shared.signInUser(with: userRequest) { [weak self] result in
            switch result {
            case .success(let user):
                print("User signed in successfully: \(user.email ?? "No email")")
                self?.coordinator?.finish()
            case .failure(let error):
                print("Error signing in: \(error.localizedDescription)")
            }
        }
    }
    
    func finish() {
        coordinator?.finish()
    }
}

