//
//  TabBarController.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

final class TabBarController: UITabBarController {

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call method's
        setupTabBar()
    }
    
    //MARK: - Private methods
    /// Method for installing tab bar
    private func setupTabBar() {
        // Setup view controllers for tab bar
         viewControllers = [
            setupViewControllers(viewController: MainViewController(), title: "Главная", normalImage: "list.bullet.clipboard", selectedImage: "list.clipboard.fill"),
            setupViewControllers(viewController: CatalogViewController(), title: "Каталог", normalImage: "greetingcard", selectedImage: "greetingcard.fill"),
            setupViewControllers(viewController: BasketViewController(), title: "Корзина", normalImage: "cart", selectedImage: "cart.fill"),
            setupViewControllers(viewController: ProfileViewController(), title: "Профиль", normalImage: "person", selectedImage: "person.fill")
         ]
        
        // Setup tab bar colors
        tabBar.tintColor = .systemGreen
    }
    
    /// Method for setting an element in a tab bar
    private func setupViewControllers(viewController: UIViewController, title: String, normalImage: String = "", selectedImage: String = "") -> UIViewController {
    
        viewController.title = title
        viewController.tabBarItem.image = UIImage(systemName: normalImage)
        viewController.tabBarItem.selectedImage = UIImage(systemName: selectedImage)
        return viewController
    }
}
