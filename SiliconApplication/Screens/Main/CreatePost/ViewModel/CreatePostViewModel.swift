//
//  CreatePostViewModel.swift
//  SiliconApplication
//
//  Created by Егорио on 20.02.2025.
//

import Foundation

class CreatePostViewModel: ObservableObject {
    private weak var coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}
