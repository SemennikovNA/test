//
//  ReviewCollectionView.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

class ReviewCollectionView: UICollectionView {
    
    //MARK: - Properties
    
    let values = Values()
    
    //MARK: - Initialize
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        // Call method's
        setupCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    /// Setup collection
    private func setupCollection() {
        self.register(ReviewsCollectionCell.self, forCellWithReuseIdentifier: ReviewsCollectionCell.reuseID)
        self.register(ReviewCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ReviewCollectionViewHeader.reuseID)
        self.showsHorizontalScrollIndicator = false
    }
}
