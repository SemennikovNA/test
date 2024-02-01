//
//  ReviewsCollectionCell.swift
//  Spar
//
//  Created by Nikita on 01.02.2024.
//

import UIKit

final class ReviewsCollectionCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let reuseID = "ReviewCell"
    
    //MARK: - User interface elements
    
    private lazy var contentCellView = UIView()
    private lazy var nameLabel = UILabel(font: .boldSystemFont(ofSize: 16), textColor: .black)
    private lazy var dateLabel = UILabel(font: .systemFont(ofSize: 12), textColor: .gray)
    private lazy var starCountView = ReviewsStar()
    private lazy var reviewLabel = UILabel(font: .systemFont(ofSize: 15), textColor: .darkGray)
    
    //MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Call method's
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.width / 11
        self.layer.masksToBounds = true
    }
    
    //MARK: - Private methods
    /// Setup cell elements
    private func setupCell() {
        // Setup cell
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.3
        self.addSubviews(contentCellView)
        
        // Setup review label
        reviewLabel.numberOfLines = 0
        reviewLabel.adjustsFontSizeToFitWidth = true
        reviewLabel.minimumScaleFactor = 0.5
        
        // Setup content cell view
        contentCellView.addSubviews(
            nameLabel,
            dateLabel,
            starCountView,
            reviewLabel
        )
    }
    
    //MARK: - Open methods
    /// Method configure cell data
    func configureCell(with model: ReviewModel) {
                nameLabel.text = model.name
                dateLabel.text = model.date
                reviewLabel.text = model.review
    }
}

//MARK: - Private extension

private extension ReviewsCollectionCell {
    /// Setup constraints for each elements in cell
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Content cell view
            contentCellView.topAnchor.constraint(equalTo: self.topAnchor),
            contentCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    
            // Name label
            nameLabel.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // Date label
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -20),
            dateLabel.heightAnchor.constraint(equalToConstant: 10),
            
            // Star count view
            starCountView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            starCountView.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 20),
            starCountView.widthAnchor.constraint(equalToConstant: 100),
            starCountView.heightAnchor.constraint(equalToConstant: 20),
            
            // Review label
            reviewLabel.topAnchor.constraint(equalTo: starCountView.bottomAnchor, constant: 5),
            reviewLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 20),
            reviewLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -20),
            reviewLabel.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -5)
        ])
    }
}
