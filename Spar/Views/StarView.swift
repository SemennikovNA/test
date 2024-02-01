//
//  StarView.swift
//  Spar
//
//  Created by Nikita on 01.02.2024.
//

import UIKit

class StarView: UIView {
    
        /// Method for drawing
        override func draw(_ rect: CGRect) {
            let starImage = self.starImage(size: rect.size)
            
            self.layer.mask = CALayer()
            self.layer.mask?.contents = starImage.cgImage
            self.layer.mask?.bounds = rect
            self.layer.mask?.position = CGPoint(x: rect.midX, y: rect.midY)
        }
        
    /// Method for filling a star
        private func starImage(size: CGSize) -> UIImage {
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            
            let starPath = self.starPath(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            starPath.fill()
            
            let starImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            
            return starImage
        }
        
        /// Method for make star
        private func starPath(in rect: CGRect) -> UIBezierPath {
            let path = UIBezierPath()
            
            let center = CGPoint(x: rect.origin.x + rect.width / 2.0, y: rect.origin.y + rect.height / 2.0)
            
            let pointsOnStar = 5  // Используйте 5 точек для одной звезды
            
            var angle: CGFloat = CGFloat(CGFloat.pi / 2.0)
            let angleIncrement = CGFloat(Double.pi * 2.0 / Double(pointsOnStar))
            let radius: CGFloat = rect.width / 2.0
            let midRadius: CGFloat = 0.45 * radius
            
            var firstPoint = true
            
            for _ in 1...pointsOnStar {
                let point = pointFrom(angle: angle, radius: midRadius, offset: center)
                let nextPoint = pointFrom(angle: angle + angleIncrement, radius: midRadius, offset: center)
                let midPoint = pointFrom(angle: angle + angleIncrement / 2.0, radius: radius, offset: center)
                
                if firstPoint {
                    firstPoint = false
                    path.move(to: point)
                }
                path.addLine(to: midPoint)
                path.addLine(to: nextPoint)
                
                angle += angleIncrement
            }
            path.close()
            
            return path
        }
        
        /// Method for determining points
        private func pointFrom(angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
            let x = radius * cos(angle) + offset.x
            let y = radius * sin(angle) + offset.y
            return CGPoint(x: x, y: y)
        }
}

