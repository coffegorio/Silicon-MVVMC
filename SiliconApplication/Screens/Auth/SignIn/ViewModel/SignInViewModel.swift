//
//  SignInViewModel.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import Foundation

class SignInViewModel: ObservableObject {
    private weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator?) {
        self.coordinator = coordinator
    }
}
