//
//  ReviewsStar.swift
//  Spar
//
//  Created by Nikita on 01.02.2024.
//

import UIKit

final class ReviewsStar: UIView {
    
    //MARK: - User elements
    
    private lazy var firstStar = StarView()
    private lazy var secondStar = StarView()
    private lazy var thirdStar = StarView()
    private lazy var fourthStar = StarView()
    private lazy var fifthStar = StarView()
    private lazy var horizontalStack = UIStackView(arrangedSubviews: [firstStar, secondStar, thirdStar, fourthStar, fifthStar])
    
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
    
    //MARK: - Private method
    
    private func setupView() {
        // Setup view
        self.addSubviews(horizontalStack)
        
        // Setup stack
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fillProportionally
        
        // Setup stars
        firstStar.backgroundColor = .systemYellow
        secondStar.backgroundColor = .systemYellow
        thirdStar.backgroundColor = .systemYellow
        fourthStar.backgroundColor = .systemYellow
        fifthStar.backgroundColor = .systemGray5
    }
}

//MARK: - Private extension

private extension ReviewsStar {
        /// Setup constraints for each star
    func setupConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: self.topAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
