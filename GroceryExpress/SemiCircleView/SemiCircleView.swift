//
//  SemiCircleView.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 21/03/23.
//

import Foundation
import UIKit

class SemiCirleView: UIView {
    
    var semiCirleLayer: CAShapeLayer = CAShapeLayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let arcCenter = CGPoint(x: bounds.size.width / 2, y:0)
        let circleRadius = bounds.size.width / 2
        let circlePath = UIBezierPath(arcCenter: arcCenter, radius: circleRadius, startAngle: CGFloat.pi, endAngle: CGFloat.pi * 2, clockwise: false)
        
        semiCirleLayer.path = circlePath.cgPath
        semiCirleLayer.fillColor = UIColor.systemGreen.cgColor
        semiCirleLayer.name = "GreenCircleLayer"
        
        if !(layer.sublayers?.contains(where: {$0.name == "GreenCircleLayer"}) ?? false) {
            layer.addSublayer(semiCirleLayer)
        }
    
        // Make the view color transparent
        backgroundColor = UIColor.clear
    }
}
