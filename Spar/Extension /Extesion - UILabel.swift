//
//  Extesion - UILabel.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

extension UILabel {
    
    convenience init(text: String? = nil, font: UIFont? = .systemFont(ofSize: 14), textColor: UIColor? = nil) {
        self.init(frame: .infinite)
        
        if let text = text {
            self.text = text
        }
            
        if let font = font {
            self.font = font
        }
        
        if let color = textColor {
            self.textColor = color
        }
    }
}
