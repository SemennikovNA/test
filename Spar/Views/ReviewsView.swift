//
//  ReviewsView.swift
//  Spar
//
//  Created by Nikita on 01.02.2024.
//

import UIKit

final class ReviewsView: UIView {
    
    //MARK: - User interface elements
    
    lazy var reviewsCollection = ReviewCollectionView()
    private lazy var headerTitle = UILabel(text: "", font: .boldSystemFont(ofSize: 17), textColor: .black)
    private lazy var viewAllReviewsButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .boldSystemFont(ofSize: 13)
        button.setTitleColor(.systemGreen, for: .normal)
        return button
    }()
    private lazy var addedReviewButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemGreen, for: .normal)
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.layer.borderWidth = 1
        return button
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addedReviewButton.layer.cornerRadius = addedReviewButton.frame.size.width / 25
        addedReviewButton.layer.masksToBounds = true
    }
    
    //MARK: - Private method
    
    private func setupView() {
        self.addSubviews(
            headerTitle,
            viewAllReviewsButton,
            reviewsCollection,
            addedReviewButton
        )
    }
    
    //MARK: - Open methods
    /// Method for setup title for user elements in view
    func setupTitles(with model: Values) {
        let viewAllButtonTitle = model.headerButtonTitle
        let addedReviewButtonTitle = model.addedReview
        headerTitle.text = model.headerTitleText
        viewAllReviewsButton.setTitle(viewAllButtonTitle, for: .normal)
        addedReviewButton.setTitle(addedReviewButtonTitle, for: .normal)
    }
    
    func addTarhgetForViewAllReviewsButton(target: Any, selector: Selector) {
        viewAllReviewsButton.addTarget(target, action: selector, for: .touchUpInside)
    }
    
    /// Method for setup targets for added review button
    func addTargetForAddedReviewButton(target: Any, selector: Selector) {
        addedReviewButton.addTarget(target, action: selector, for: .touchUpInside)
    }
}

//MARK: - Private extension

private extension ReviewsView {
    /// Method for setup contraints reviews view
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Header title
            headerTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            headerTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            headerTitle.heightAnchor.constraint(equalToConstant: 50),
            
            // View all reviews button
            viewAllReviewsButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            viewAllReviewsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            viewAllReviewsButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Review collection
            reviewsCollection.topAnchor.constraint(equalTo: headerTitle.bottomAnchor),
            reviewsCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            reviewsCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            reviewsCollection.heightAnchor.constraint(equalToConstant: 150),
            
            // Added reviews button
            addedReviewButton.topAnchor.constraint(equalTo: reviewsCollection.bottomAnchor, constant: 10),
            addedReviewButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            addedReviewButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            addedReviewButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
