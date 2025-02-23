//
//  SignUpViewModel.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import Foundation
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var alertMessage = ""

    private weak var coordinator: AuthCoordinator?

    init(coordinator: AuthCoordinator?) {
        self.coordinator = coordinator
    }

    func backToLogin() {
        self.coordinator?.showSignInView()
    }

    func finishSignUp(email: String, password: String) {
        isLoading = true

        SignUpManager.shared.registerUser(with: email, password: password) { [weak self] success, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if success {
                    self?.alertMessage = "Регистрация прошла успешно!"
                    self?.showAlert = true
                    self?.coordinator?.finish()
                } else {
                    self?.alertMessage = error?.localizedDescription ?? "Произошла ошибка"
                    self?.showAlert = true
                }
            }
        }
    }
}
