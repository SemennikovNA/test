//
//  Extension - UIStackView.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubview(view: UIView...) {
        view.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addArrangedSubview(view)
        }
    }
}
