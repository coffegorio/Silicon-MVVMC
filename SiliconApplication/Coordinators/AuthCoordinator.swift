//
//  AuthCoordinator.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import UIKit
import SwiftUI

class AuthCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [any Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showSignInView()
    }
    
    private func showSignInView() {
        let signInViewModel = SignInViewModel(coordinator: self)
        let signInView = SignInView(viewModel: signInViewModel)
        let hostingController = UIHostingController(rootView: signInView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func showSignUpView() {
        let signUpViewModel = SignUpViewModel(coordinator: self)
        let signUpView = SignUpView(viewModel: signUpViewModel)
        let hostingController = UIHostingController(rootView: signUpView)
        hostingController.modalPresentationStyle = .formSheet
        navigationController.present(hostingController, animated: true)
    }
    
    func showResetPassword() {
        let resetPasswordViewModel = ResetPasswordViewModel(coordinator: self)
        let resetPasswordView = ResetPasswordView(viewModel: resetPasswordViewModel)
        let hostingController = UIHostingController(rootView: resetPasswordView)
        hostingController.modalPresentationStyle = .formSheet
        navigationController.present(hostingController, animated: true)
    }
    
    func finish() {
        childCoordinators.removeAll()
        
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
}

