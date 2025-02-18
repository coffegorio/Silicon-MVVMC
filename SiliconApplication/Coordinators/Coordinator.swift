//
//  Coordinator.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
    func finish()
}
