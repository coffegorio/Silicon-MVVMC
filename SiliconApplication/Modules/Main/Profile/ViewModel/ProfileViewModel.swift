//
//  ProfileViewModel.swift
//  SiliconApplication
//
//  Created by Егорио on 20.02.2025.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var isLoading = false
    
    private weak var coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func logOut() {
        isLoading = true
        
        SignOutManager.shared.signOut { [weak self] error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Ошибка при выходе: \(error.localizedDescription)")
                } else {
                    UserDefaultsManager.shared.removeUsername()
                    self?.coordinator?.finish()
                }
            }
        }
    }
}

