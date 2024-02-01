//
//  StarView.swift
//  Spar
//
//  Created by Nikita on 01.02.2024.
//

import UIKit
import Darwin

class StarView: UIView {
    
    // Свойства для звезды
    var points: Int = 5
    var rayLength: CGFloat = 20.0
    var starColor: UIColor = .yellow
    
    override func draw(_ rect: CGRect) {
            guard let context = UIGraphicsGetCurrentContext() else { return }
            
            // Получаем центр звезды
            let starCenter = CGPoint(x: rect.midX, y: rect.midY)

            context.move(to: starCenter)

            var angle = -CGFloat.pi / 2.0
            let angleIncrement = CGFloat.pi * 2.0 / CGFloat(points * 2)

            for _ in 0..<points * 2 {
                let endPoint = CGPoint(x: starCenter.x + cos(angle) * rayLength,
                                       y: starCenter.y + sin(angle) * rayLength)

                context.addLine(to: endPoint)

                angle += angleIncrement

                let nextEndPoint = CGPoint(x: starCenter.x + cos(angle) * rayLength,
                                           y: starCenter.y + sin(angle) * rayLength)

                context.addLine(to: nextEndPoint)

                angle += angleIncrement
            }

            context.closePath()
            context.setFillColor(starColor.cgColor)
            context.fillPath()
        }
}
