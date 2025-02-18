//
//  AppCoordinator.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [any Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        showPreviewScreen()
    }
    
    private func showPreviewScreen() {
        let previewView = PreviewView()
        let previewViewModel = PreviewViewModel(coordinator: self)
        previewView.viewModel = previewViewModel
        navigationController.pushViewController(previewView, animated: true)
    }
    
    func finish() {
        childCoordinators.removeAll()
        
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }
}
