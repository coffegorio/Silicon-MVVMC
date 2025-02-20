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
        let tabBarController = setupTabBar()
        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    private func setupTabBar() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let newsFeedView = NewsFeedView(viewModel: NewsFeedViewModel(coordinator: self))
        let createPostView = CreatePostView(viewModel: CreatePostViewModel(coordinator: self))
        
        let presentationViewModel = PresentationBuilderViewModel(coordinator: self)
        let presentationView = PresentationBuilderView()
        presentationView.viewModel = presentationViewModel

        let profileView = ProfileView(viewModel: ProfileViewModel(coordinator: self))
        
        let newsFeedNav = createNavController(
            for: newsFeedView,
            title: "Новости",
            image: UIImage(systemName: "house")
        )

        let createPostNav = createNavController(
            for: createPostView,
            title: "Создать",
            image: UIImage(systemName: "plus")
        )

        let presentationNav = UINavigationController(rootViewController: presentationView)
        presentationNav.tabBarItem = UITabBarItem(title: "Презентации", image: UIImage(systemName: "doc.richtext"), selectedImage: nil)

        let profileNav = createNavController(
            for: profileView,
            title: "Профиль",
            image: UIImage(systemName: "person")
        )

        tabBarController.viewControllers = [newsFeedNav, createPostNav, presentationNav, profileNav]
        tabBarController.tabBar.tintColor = ApplicationColors.mochaMousse
        return tabBarController
    }
    
    private func createNavController<V: View>(
        for view: V,
        title: String,
        image: UIImage?
    ) -> UINavigationController {
        
        let hostingController = UIHostingController(rootView: view)
        hostingController.title = title
        hostingController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)
        
        return UINavigationController(rootViewController: hostingController)
    }
    
    func finish() {
        if let coordinatorToRemove = childCoordinators.first {
            childCoordinators.removeAll { $0 === coordinatorToRemove }
        }
        
        let appCoordinator = AppCoordinator(navigationController: navigationController)
        childCoordinators.append(appCoordinator)
        appCoordinator.start()
    }
}
