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
    
    private lazy var productInfoStack: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
        
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
    
    //MARK: - Private methods
    
    private func setupView() {
        self.addSubviews(productImage)
        productImage.addSubviews(priceToTheCardImage, saleImage, productName)
    }
    
    //MARK: - Open methods
    /// Setup value for product name title
    func setProductName(title: String) {
        productName.text = title
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
            productName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            productName.widthAnchor.constraint(equalToConstant: 200),
            productName.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
