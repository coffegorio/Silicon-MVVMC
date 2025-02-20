//
//  ProfileViewModel.swift
//  SiliconApplication
//
//  Created by Егорио on 20.02.2025.
//

import Foundation

class ProfileViewModel: ObservableObject {
    private weak var coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func logOut() {
        coordinator?.finish() // Вызываем метод finish для возврата на экран предварительного просмотра
    }
}
