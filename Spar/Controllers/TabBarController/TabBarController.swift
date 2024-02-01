//
//  TabBarController.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    //MARK: - Properties
    
    let values = Values()

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
            setupViewControllers(viewController: MainViewController(), title: values.mainTitle, normalImage: values.mainNormalImage, selectedImage: values.mainSelectedImage),
            setupViewControllers(viewController: CatalogViewController(), title: values.catalogTitle, normalImage: values.catalogNormalImage, selectedImage: values.catalogSelectedImage),
            setupViewControllers(viewController: BasketViewController(), title: values.basketTitle, normalImage: values.basketNormalImage, selectedImage: values.basketSelectedImage),
            setupViewControllers(viewController: ProfileViewController(), title: values.profileTitle, normalImage: values.profileNormalImage, selectedImage: values.profileSelectedImage)
         ]
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
