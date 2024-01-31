//
//  ProductCardView.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

class ProductCardView: UIView {
    
    //MARK: - User elements
    
    private lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "product")
        image.contentMode = .scaleAspectFit
        return image
    }()
    private lazy var priceToTheCardImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "priceOnCard")
        return image
    }()
    private lazy var saleImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sale")
        return image
    }()
    private lazy var productName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        return label
    }()
    private lazy var manufacturedCountryImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.image = UIImage(named: "spain")
        return image
    }()
    private lazy var manufacturedCountryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .darkGray
        return label
    }()
    private lazy var productInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        stack.distribution = .equalSpacing
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return stack
    }()
    
    // Label's
    private lazy var descriptionLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 15), textColor: .black)
    private lazy var descriptionInfoLabel = UILabel(text: "", font: .systemFont(ofSize: 12), textColor: .black)
    private lazy var mainCharacteristics = UILabel(text: "Основные характеристики", font: .boldSystemFont(ofSize: 15), textColor: .black)
        
    //MARK: - Inititalize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Call method's
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        manufacturedCountryImage.layer.cornerRadius = manufacturedCountryImage.frame.size.width / 2
    }
    
    //MARK: - Private methods
    
    private func setupView() {
        self.addSubviews(productImage, productName, manufacturedCountryImage, manufacturedCountryLabel, productInfoStack)
        productImage.addSubviews(priceToTheCardImage, saleImage)
        productInfoStack.addArrangedSubviews(descriptionLabel, descriptionInfoLabel, mainCharacteristics)
    }
    
    //MARK: - Open methods
    /// Setup value for product name title
    func setProductName(title: String) {
        productName.text = title
    }
    
    func setManufaturedCountryLabel(title: String) {
        manufacturedCountryLabel.text = title
    }
    
    func setDescriptionInfo(title: String, allDescription: String) {
        descriptionLabel.text = title
        descriptionInfoLabel.text = allDescription
        descriptionInfoLabel.numberOfLines = 0
    }
}


//MARK: - Extension

private extension ProductCardView {
    /// Method for setup contraints product card view
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Product image view
            productImage.topAnchor.constraint(equalTo: self.topAnchor),
            productImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productImage.heightAnchor.constraint(equalToConstant: 250),
            
            // Price to the card image view
            priceToTheCardImage.topAnchor.constraint(equalTo: productImage.topAnchor, constant: 10),
            priceToTheCardImage.leadingAnchor.constraint(equalTo: productImage.leadingAnchor, constant: 10),
            priceToTheCardImage.heightAnchor.constraint(equalToConstant: 30),
            priceToTheCardImage.widthAnchor.constraint(equalToConstant: 100),
            
            // Sale image view
            saleImage.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: -10),
            saleImage.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: -10),
            saleImage.heightAnchor.constraint(equalToConstant: 40),
            saleImage.widthAnchor.constraint(equalToConstant: 70),
            
            // Product name label
            productName.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10),
            productName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            productName.widthAnchor.constraint(equalToConstant: 200),
            productName.heightAnchor.constraint(equalToConstant: 70),
            
            // Manufactured country image
            manufacturedCountryImage.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 10),
            manufacturedCountryImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            manufacturedCountryImage.widthAnchor.constraint(equalToConstant: 30),
            manufacturedCountryImage.heightAnchor.constraint(equalToConstant: 30),
            
            // Manufactured country label
            manufacturedCountryLabel.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 10),
            manufacturedCountryLabel.leadingAnchor.constraint(equalTo: manufacturedCountryImage.trailingAnchor, constant: 20),
            manufacturedCountryLabel.widthAnchor.constraint(equalToConstant: 150),
            manufacturedCountryLabel.heightAnchor.constraint(equalToConstant: 30),
            
            // Product info stack
            productInfoStack.topAnchor.constraint(equalTo: manufacturedCountryLabel.bottomAnchor, constant: 20),
            productInfoStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            productInfoStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            productInfoStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            // Description
//            descriptionLabel.topAnchor.constraint(equalTo: productInfoStack.topAnchor),
//            descriptionLabel.leadingAnchor.constraint(equalTo: productInfoStack.leadingAnchor),
        ])
    }
}
