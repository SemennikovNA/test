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
}
