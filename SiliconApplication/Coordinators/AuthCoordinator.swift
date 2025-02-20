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
        showMainAuthView()
    }
    
    func showMainAuthView() {
        let mainAuthViewModel = MainAuthViewModel(coordinator: self)
        let mainAuthView = MainAuthView(viewModel: mainAuthViewModel)
        let hostingController = UIHostingController(rootView: mainAuthView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func showSignInView() {
        let signInViewModel = SignInViewModel(coordinator: self)
        let signInView = SignInView(viewModel: signInViewModel)
        let hostingController = UIHostingController(rootView: signInView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func showSignUpView() {
        let signUpViewModel = SignUpViewModel(coordinator: self)
        let signUpView = SignUpView(viewModel: signUpViewModel)
        let hostingController = UIHostingController(rootView: signUpView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func showResetPassword() {
        let resetPasswordViewModel = ResetPasswordViewModel(coordinator: self)
        let resetPasswordView = ResetPasswordView(viewModel: resetPasswordViewModel)
        let hostingController = UIHostingController(rootView: resetPasswordView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func finish() {
        if let coordinatorToRemove = childCoordinators.first {
            childCoordinators.removeAll { $0 === coordinatorToRemove }
        }
        
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
}

