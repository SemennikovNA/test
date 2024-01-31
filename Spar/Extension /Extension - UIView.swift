//
//  Extension - UIView.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

extension UIView {
    /// Custom method for adding sub views and disabling authoresizing mask into constraints
    func addSubviews(_ view: UIView...) {
        view.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
    
    func dropShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2, height: -5)
        self.layer.shadowRadius = 5
    }
}
