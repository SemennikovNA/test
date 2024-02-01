//
//  Extension - UIStackView.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

extension UIStackView {
    /// Custom method for add arranged subviews and disabling authoresizing mask into constraints
    func addArrangedSubviews(_ view: UIView...) {
        view.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addArrangedSubview(view)
        }
    }
}
