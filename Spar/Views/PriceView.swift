//
//  PriceView.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

final class PriceView: UIView {
    
    //MARK: - User elements
    
    lazy var greenPriceView = GreenPriceView()
    private lazy var choiceOfPackagingSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Шт", "Кг"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        let mainText = "55.9"
        let subscriptText = " ₽/кг"
        let attributedText = NSMutableAttributedString(string: mainText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 35)])
         attributedText.append(NSAttributedString(string: subscriptText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]))
         label.attributedText = attributedText
         return label
    }()
    private lazy var oldPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        label.text = "1̶9̶9̶,̶0̶"
        return label
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        greenPriceView.layer.cornerRadius = greenPriceView.frame.size.width / 6
        greenPriceView.layer.masksToBounds = true
    }
    
    //MARK: - Private methods
    
    private func setupView() {
        self.addSubviews(
            choiceOfPackagingSegmentedControl,
            priceLabel,
            oldPrice,
            greenPriceView
        )
    }
    
    //MARK: - Open methods
    
    func addTargetsForChoiceOfPackagingSegmentedControl(target: Any, selector: Selector) {
        choiceOfPackagingSegmentedControl.addTarget(target, action: selector, for: .valueChanged)
    }
}


//MARK: - Private extension

private extension PriceView {
    /// Method for setup contraints price view
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Choice of packaging segmented control
            choiceOfPackagingSegmentedControl.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            choiceOfPackagingSegmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            choiceOfPackagingSegmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            // Price label
            priceLabel.topAnchor.constraint(equalTo: choiceOfPackagingSegmentedControl.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            priceLabel.widthAnchor.constraint(equalToConstant: 110),
            priceLabel.heightAnchor.constraint(equalToConstant: 40),
            
            // Old price
            oldPrice.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            oldPrice.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            oldPrice.widthAnchor.constraint(equalToConstant: 50),
            oldPrice.heightAnchor.constraint(equalToConstant: 20),
            
            greenPriceView.topAnchor.constraint(equalTo: choiceOfPackagingSegmentedControl.bottomAnchor, constant: 20),
            greenPriceView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            greenPriceView.widthAnchor.constraint(equalToConstant: 180),
            greenPriceView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}

