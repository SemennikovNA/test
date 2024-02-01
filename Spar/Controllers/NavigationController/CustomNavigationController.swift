//
//  CustomNavigationController.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

final class CustomNavigationController: UINavigationController {
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    // MARK: - Private Methods
    /// Setup left bar button item
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
    
    /// Setup rigth bar button item's
    private func configureRightButtons(for viewController: UIViewController) {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(goBack))
        let listButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet.rectangle.portrait"), style: .done, target: self, action: #selector(listButtonTapped))
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(shareButtonTapped))
        let likeButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .done, target: self, action: #selector(likeButtonTapped))
        let navigationButtons = [backButton, listButton, likeButton, shareButton]
        navigationButtons.forEach { item in
            item.tintColor = .systemGreen
        }
        viewController.navigationItem.rightBarButtonItems = [likeButton, shareButton, listButton]
    }
    
    
    // MARK: - Objective - C methods
    /// Action method for left bar button item
    @objc private func goBack() {
        print("Назад")
    }
    
    /// Action method for list bar button item
    @objc private func listButtonTapped() {
        print("Посмотреть похожие")
    }
    
    /// Action method for share bar button item
    @objc private func shareButtonTapped() {
        print("Поделится товаром")
    }
    
    /// Action method for like bar button item
    @objc private func likeButtonTapped() {
        print("Нравится этот товар")
    }
}

//MARK: - Extension
// MARK: UINavigationControllerDelegate
extension CustomNavigationController: UINavigationControllerDelegate {
    
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
}
