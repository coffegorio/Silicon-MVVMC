//
//  NewsFeedViewModel.swift
//  SiliconApplication
//
//  Created by Егорио on 20.02.2025.
//

import Foundation
import SwiftUI

class NewsFeedViewModel: ObservableObject {
    
    private weak var coordinator: MainCoordinator?
    
    @Published var userName: String?
    @Published var isUserNameEmpty: Bool = false
    
    private var updateTimer: Timer?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.loadUserName()
    }
    
    func loadUserName() {
        if let savedUserName = UserDefaults.standard.string(forKey: "userName") {
            self.userName = savedUserName
            self.isUserNameEmpty = false
        } else {
            FirestoreManager.shared.getUser { [weak self] userModel, error in
                if let userModel = userModel {
                    self?.userName = userModel.userName ?? ""
                    self?.isUserNameEmpty = userModel.userName == nil
                } else {
                    self?.isUserNameEmpty = true
                }
            }
        }
    }
    
    func updateUserName(newName: String) {
        // Инвалидируем старый таймер
        updateTimer?.invalidate()
        
        // Запускаем новый таймер для дебаунса
        updateTimer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { [weak self] _ in
            FirestoreManager.shared.updateUserName(newName) { success, error in
                if success {
                    UserDefaults.standard.set(newName, forKey: "userName")
                    self?.userName = newName
                    self?.isUserNameEmpty = false
                }
            }
        }
    }
}
