//
//  ProductCardView.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

final class ProductCardView: UIView {
    
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
    private lazy var reviewStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = -20
        return stack
    }()
    private lazy var starImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "star")
        return image
    }()
    private lazy var reviewLabel: UILabel = {
        let label = UILabel()
        let mainText = "4.1"
        let subscriptText = " | 19 отзывов"
        let attributedText = NSMutableAttributedString(string: mainText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)])
        let subscriptAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 15),
              .foregroundColor: UIColor.gray
          ]
        attributedText.append(NSAttributedString(string: subscriptText, attributes: subscriptAttributes))
        label.attributedText = attributedText
        return label
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
    private lazy var allCharacteristics: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemGreen, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return button
    }()
    // Label's
    private lazy var descriptionLabel = UILabel(font: .boldSystemFont(ofSize: 15), textColor: .black)
    private lazy var descriptionInfoLabel = UILabel(font: .systemFont(ofSize: 12), textColor: .black, numberOfLines: 0)
    private lazy var mainCharacteristics = UILabel(font: .boldSystemFont(ofSize: 15), textColor: .black)
    private lazy var manufacturedLabel = UILabel(font: .systemFont(ofSize: 12), textColor: .black)
    private lazy var energyPriceLabel = UILabel(font: .systemFont(ofSize: 12), textColor: .black)
    private lazy var fatsLabel = UILabel(font: .systemFont(ofSize: 12), textColor: .black)
    private lazy var proteinLabel = UILabel(font: .systemFont(ofSize: 12), textColor: .black)
    private lazy var carbohydratesLabel = UILabel(font: .systemFont(ofSize: 12), textColor: .black)
        
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
        // Setup view
        self.addSubviews(
            productImage,
            productName,
            manufacturedCountryImage,
            manufacturedCountryLabel,
            productInfoStack
        )
        productImage.addSubviews(
            priceToTheCardImage,
            saleImage,
            reviewStack
        )
        reviewStack.addArrangedSubviews(
            starImage,
            reviewLabel
        )
        productInfoStack.addArrangedSubviews(
            descriptionLabel,
            descriptionInfoLabel,
            mainCharacteristics,
            manufacturedLabel,
            energyPriceLabel,
            fatsLabel,
            proteinLabel,
            carbohydratesLabel,
            allCharacteristics
        )
    }
    
    //MARK: - Open methods
    /// Setup value for product name title's
    func setupTitles(with model: Values) {
        productName.text = model.productName
        manufacturedCountryLabel.text = model.manufacturerСountry
        descriptionLabel.text = model.description
        descriptionInfoLabel.text = model.descriptionInfo
        mainCharacteristics.text = model.mainCharacteristicsTitle
        manufacturedLabel.text = model.manufacturedLabelTitle
        energyPriceLabel.text = model.energyPriceLabelTitle
        fatsLabel.text = model.fatsLabelTitle
        proteinLabel.text = model.proteinLabelTitle
        carbohydratesLabel.text = model.carbohydratesLabelTitle
        allCharacteristics.setTitle(model.allCharacteristicsButtonTitle, for: .normal)
    }
    
    /// Add target for allCharacteristics button
    func addTargetForAllCharacteristicsButton(target: Any, selector: Selector) {
        allCharacteristics.addTarget(target, action: selector, for: .touchUpInside)
    }
}

//MARK: - Private extension

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
            saleImage.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 5),
            saleImage.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: -10),
            saleImage.heightAnchor.constraint(equalToConstant: 30),
            saleImage.widthAnchor.constraint(equalToConstant: 50),
            
            // Review stack
            reviewStack.leadingAnchor.constraint(equalTo: productImage.leadingAnchor),
            reviewStack.bottomAnchor.constraint(equalTo: productImage.bottomAnchor),
            reviewStack.widthAnchor.constraint(equalToConstant: 155),
            reviewStack.heightAnchor.constraint(equalToConstant: 20),
            
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
        ])
    }
}
