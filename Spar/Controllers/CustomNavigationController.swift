//
//  CustomNavigationController.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

final class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    // MARK: - UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        let isListViewController = viewController is MainViewController
        setNavigationBarHidden(isListViewController, animated: true)
        
        if !(viewController is MainViewController) {
            configureBackButton(for: viewController)
        }
        
        if !(viewController is MainViewController) {
            configureRightButtons(for: viewController)
        }
    }
    
    // MARK: - Private Actions
    @objc private func goBack() {
        popToRootViewController(animated: true)
    }
    
    // MARK: - Private Methods
    private func configureBackButton(for viewController: UIViewController) {
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .plain,
            target: self,
            action: #selector(goBack))
        
        backButton.tintColor = .systemGreen
        viewController.navigationItem.leftBarButtonItem = backButton
        navigationBar.prefersLargeTitles = false
    }
    
    private func configureRightButtons(for viewController: UIViewController) {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(goBack))
        let listButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet.rectangle.portrait"), style: .done, target: self, action: #selector(goBack))
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(goBack))
        let likeButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .done, target: self, action: #selector(goBack))
        let navigationButtons = [backButton, listButton, likeButton, shareButton]
        navigationButtons.forEach { item in
            item.tintColor = .systemGreen
        }
        viewController.navigationItem.rightBarButtonItems = [likeButton, shareButton, listButton]
    }
}
