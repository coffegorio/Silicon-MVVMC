//
//  MainCoordinator.swift
//  SiliconApplication
//
//  Created by Егорио on 19.02.2025.
//

import UIKit
import SwiftUI

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [any Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func finish() {
        
    }
}
