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
    
    func finish() {
        
    }
}

