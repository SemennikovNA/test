//
//  TabBarController.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

class TabBarController: UITabBarController {

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call method's
        setupTabBar()
    }
    
    //MARK: - Private methods
    /// Method for installing tab bar
    private func setupTabBar() {
         viewControllers = [
            setupViewControllers(viewController: MainViewController(), title: "Главная", image: nil)
         ]
    }
    
    /// Method for setting an element in a tab bar
    private func setupViewControllers(viewController: UIViewController, title: String, image: UIImage? = nil) -> UIViewController {
        viewController.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
