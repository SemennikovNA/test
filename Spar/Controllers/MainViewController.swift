//
//  ViewController.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - User elements
    
    private lazy var priceView = PriceView()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call method's
        setupView()
        setupConstraints()
    }
    
    //MARK: - Private methods
    /// Method for setup main view controller
    private func setupView() {
        view.backgroundColor = .white
        view.addSubviews(priceView)
        priceView.dropShadow()

    }
}

private extension MainViewController {
    /// Method for setup contraints main view controller
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            priceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            priceView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            priceView.heightAnchor.constraint(equalToConstant: 140),
            priceView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

