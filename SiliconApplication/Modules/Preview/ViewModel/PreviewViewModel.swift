//
//  PreviewViewModel.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import Foundation

class PreviewViewModel {
    private weak var coordinator: AppCoordinator?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func showSignIn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.coordinator?.finish()
        }
    }
    
}
