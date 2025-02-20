//
//  MainAuthViewModel.swift
//  SiliconApplication
//
//  Created by Егорио on 19.02.2025.
//

import Foundation

class MainAuthViewModel: ObservableObject {
    private weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }
    
    func showSignIn() {
        self.coordinator?.showSignInView()
    }
    
}
