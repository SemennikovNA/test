//
//  ViewController.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - Properties
    
    var values = Values()
    
    //MARK: - User elements
    
    private lazy var priceView = PriceView()
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceVertical = true
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    private lazy var contentView = UIView()
    private lazy var productCardView = ProductCardView()
    private lazy var reviewsView: ReviewsView = {
        let view = ReviewsView()
        view.reviewsCollection.delegate = self
        view.reviewsCollection.dataSource = self
        return view
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call method's
        setupView()
        setupConstraints()
    }
    
    //MARK: - Private methods
    /// Method for setup main view controller
    private func setupView() {
        // Setup view's
        view.backgroundColor = .white
        view.addSubviews(scrollView, priceView)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(productCardView, reviewsView)
        
        // Setup custom view
        priceView.dropShadow()
        
        // Set default value for label's
        priceView.greenPriceView.setTitleForProductCountLabel(title: String(values.countOfProduct))
        priceView.greenPriceView.setTitleForPriceLabel(title: String(values.productPrice))
        productCardView.setupTitles(with: values)
        reviewsView.setupTitles(with: values)
        
        // Call method's
        setupTargetsForButton()
    }
    
    /// Setup targets for buttons
    private func setupTargetsForButton() {
        // Setup target for green view button's
        priceView.addTargetsForChoiceOfPackagingSegmentedControl(target: self, selector: #selector(сhoiceOfPackagingSegmentedControlTapped))
        priceView.greenPriceView.addTargetsForMinusButton(target: self, selector: #selector(minusButtonTapped))
        priceView.greenPriceView.addTargetsForPlusButton(target: self, selector: #selector(plusButtonTapped))
        
        // Setup target for product card view button
        productCardView.addTargetForAllCharacteristicsButton(target: self, selector: #selector(allCharacteristicsButtonTapped))
        
        // Setup target for added review button
        reviewsView.addTargetForAddedReviewButton(target: self, selector: #selector(addReviewButtonTapped))
        reviewsView.addTarhgetForViewAllReviewsButton(target: self, selector: #selector(viewAllReviewsButtonTapped))
    }
    
    //MARK: - Objective - C methods
    /// Logic for choice of packaging segmented control
    @objc private func сhoiceOfPackagingSegmentedControlTapped() {
        print("Выбор упаковки")
    }
    
    /// Logic that works when you press the minus button
    @objc private func minusButtonTapped() {
        if values.countOfProduct > 1 {
            values.countOfProduct -= 1
            if values.countOfProduct == 0 {
                values.countOfProduct = 1
            }
            let price = String(values.productPrice / values.countOfProduct)
            let title = String(values.countOfProduct)
            priceView.greenPriceView.setTitleForProductCountLabel(title: title)
            priceView.greenPriceView.setTitleForPriceLabel(title: price)
        }
    }
    
    /// Logic that works when you press the plus button
    @objc private func plusButtonTapped() {
        values.countOfProduct += 1
        let price = String(values.productPrice * values.countOfProduct)
        let title = String(values.countOfProduct)
        priceView.greenPriceView.setTitleForProductCountLabel(title: title)
        priceView.greenPriceView.setTitleForPriceLabel(title: price)
    }
    
    /// Logic for all characteristics button
    @objc private func allCharacteristicsButtonTapped() {
        print("Просмотреть всех характеристики продукта")
    }
    
    /// Logic for  view all reviews button
    @objc private func viewAllReviewsButtonTapped() {
        print("Посмотреть все отзывы")
    }
    
    /// Logic for add review button
    @objc private func addReviewButtonTapped() {
        print("Добавить отзыв")
    }
}

//MARK: - Extension
//MARK: UICollectionView delegate and dataSource methods
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let countOfReviews = values.reviews.count
        return countOfReviews
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = reviewsView.reviewsCollection.dequeueReusableCell(withReuseIdentifier: ReviewsCollectionCell.reuseID, for: indexPath) as? ReviewsCollectionCell else { return UICollectionViewCell() }
        cell.configureCell(with: values.reviews[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeForItem = CGSize(width: 250, height: 140)
        return sizeForItem
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insetForSectionAt = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return insetForSectionAt
    }
}

//MARK: Constraints methods
private extension MainViewController {
    /// Method for setup contraints main view controller
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Scroll view
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: priceView.topAnchor),
            
            // Content view
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Produsct card view
            productCardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // Review collection
            reviewsView.topAnchor.constraint(equalTo: productCardView.bottomAnchor),
            reviewsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            reviewsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            reviewsView.heightAnchor.constraint(equalToConstant: 250),
            reviewsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Price view
            priceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            priceView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            priceView.heightAnchor.constraint(equalToConstant: 140),
            priceView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

