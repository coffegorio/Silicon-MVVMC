//
//  NewsFeedViewModel.swift
//  SiliconApplication
//
//  Created by Егорио on 20.02.2025.
//

import Foundation

class NewsFeedViewModel: ObservableObject {
    @Published var user: UserModel {
        didSet {
            UserManager.shared.user = user
        }
    }
    
    private weak var coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.user = UserManager.shared.user
    }
    
    var isUsernameEntered: Bool {
        !user.username.isEmpty
    }
}
