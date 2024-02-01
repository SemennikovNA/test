//
//  ReviewCollectionViewHeader.swift
//  Spar
//
//  Created by Nikita on 01.02.2024.
//

import UIKit

class ReviewCollectionViewHeader: UICollectionReusableView {
    
    //MARK: - Propertie
    
    static let reuseID = "ReviewCollectionHeaderView"
    
    //MARK: - User interface elements
    
    private lazy var headerTitle = UILabel(text: "", font: .boldSystemFont(ofSize: 17), textColor: .black)
    private lazy var viewAllReviewsButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .boldSystemFont(ofSize: 13)
        button.setTitleColor(.green, for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    //MARK: - Inititalize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Call method's
        setupReusableView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private method
    
    private func setupReusableView() {
        self.addSubviews(headerTitle, viewAllReviewsButton)
    }
    
    //MARK: - Open methods
    
    func setupHeader(with model: Values) {
        let title = model.headerButtonTitle
        headerTitle.text = model.headerTitleText
        viewAllReviewsButton.setTitle(title, for: .normal)
    }
}

//MARK: - Private extension

private extension ReviewCollectionViewHeader {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Header title
            headerTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            headerTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            headerTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            
            // View all reviews button
            viewAllReviewsButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            viewAllReviewsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            viewAllReviewsButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
        ])
    }
}
