//
//  NewsFeedViewModel.swift
//  SiliconApplication
//
//  Created by Егорио on 20.02.2025.
//

import Foundation
import SwiftUI

class NewsFeedViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    
    private weak var coordinator: MainCoordinator?
    
    @Published var userName: String?
    @Published var isUserNameEmpty: Bool = false
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.loadUserName()
    }
    
    func loadUserName() {
        if let savedUserName = UserDefaults.standard.string(forKey: "userName") {
            self.userName = savedUserName
            self.isUserNameEmpty = savedUserName.isEmpty
        } else {
            self.isUserNameEmpty = true
        }
    }
    
    func updateUserName(newName: String) {
        isLoading = true
        
        FirestoreManager.shared.updateUserName(newName) { [weak self] success, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if success {
                    UserDefaults.standard.set(newName, forKey: "userName")
                    self?.userName = newName
                    self?.isUserNameEmpty = false
                } else {
                    // Здесь можно обработать ошибку, например, показать alert
                }
            }
        }
    }
}


