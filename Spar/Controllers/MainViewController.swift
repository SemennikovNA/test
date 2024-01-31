//
//  ViewController.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - Properties
    
    var values = Values()
    
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
        // Setup view
        view.backgroundColor = .white
        view.addSubviews(priceView)
        
        // Setup custom view
        priceView.dropShadow()
        
        // Set default value for label
        priceView.greenPriceView.setTitleForPriceLabel(title: String(values.productPrice))
        priceView.greenPriceView.setTitleForProductCountLabel(title: String(values.countOfProduct))
        
        // Call method's
        setupTargetsForButton()
    }
    
    /// Setup targets for buttons
    private func setupTargetsForButton() {
        priceView.greenPriceView.addTargetsForMinusButton(target: self, selector: #selector(minusButtonTapped))
        priceView.greenPriceView.addTargetsForPlusButton(target: self, selector: #selector(plusButtonTapped))
    }
    
    //MARK: - Objective - C methods
    /// Logic that works when you press the minus button
    @objc private func minusButtonTapped() {
        if values.countOfProduct > 1 {
              values.countOfProduct -= 1
              
              if values.countOfProduct == 0 {
                  values.countOfProduct = 1
              }
              
              let price = String(values.productPrice / values.countOfProduct)
              
              
              let title = String(values.countOfProduct)
              
              priceView.greenPriceView.setTitleForProductCountLabel(title: title)
              priceView.greenPriceView.setTitleForPriceLabel(title: price)
          }
    }
    
    /// Logic that works when you press the plus button
    @objc private func plusButtonTapped() {
        values.countOfProduct += 1
        let price = String(values.productPrice * values.countOfProduct)
        let title = String(values.countOfProduct)
        
        priceView.greenPriceView.setTitleForProductCountLabel(title: title)
        priceView.greenPriceView.setTitleForPriceLabel(title: price)
    }
}

//MARK: - Extension

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

