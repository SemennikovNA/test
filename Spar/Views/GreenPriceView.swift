//
//  GreenPriceView.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

final class GreenPriceView: UIView {
    
    //MARK: - User elements
    
    private lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private lazy var productCountLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    //MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Call method's
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    private func setupView() {
        self.backgroundColor = .systemGreen
        self.addSubviews(minusButton, productCountLabel, priceLabel, plusButton)
    }
    
    //MARK: - Open methods
    /// Target for minus button
    func addTargetsForMinusButton(target: Any, selector: Selector) {
        minusButton.addTarget(target, action: selector, for: .touchUpInside)
    }
    
    /// Target for plus button
    func addTargetsForPlusButton(target: Any, selector: Selector) {
        plusButton.addTarget(target, action: selector, for: .touchUpInside)
    }
    
    /// Set title for product count label
    func setTitleForProductCountLabel(title: String) {
        productCountLabel.text = "\(title) шт"
    }
    
    /// Set title for price label
    func setTitleForPriceLabel(title: String) {
        priceLabel.text = "\(title) ₽"
    }
}

//MARK: - Extension

private extension GreenPriceView {
    /// Setup constraints for view
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Minus button
            minusButton.topAnchor.constraint(equalTo: self.topAnchor),
            minusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            minusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 50),
            
            // Product count label
            productCountLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            productCountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            productCountLabel.heightAnchor.constraint(equalToConstant: 20),
            productCountLabel.widthAnchor.constraint(equalToConstant: 50),
            
            // Price label
            priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            priceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            priceLabel.widthAnchor.constraint(equalToConstant: 80),
            
            // Plus button
            plusButton.topAnchor.constraint(equalTo: self.topAnchor),
            plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
}
