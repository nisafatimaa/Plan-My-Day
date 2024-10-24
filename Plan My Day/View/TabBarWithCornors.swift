//
//  TabBarWithCornors.swift
//  Plan My Day
//
//  Created by Nisa on 23/10/2024.
//

import UIKit

@IBDesignable class TabBarWithCornors: UITabBar {
    
    
    // MARK: - Properties
    @IBInspectable var color : UIColor?
    @IBInspectable var radii: CGFloat = 18.0
    private var shapeLayer : CALayer?
    
    
    // MARK: - TabBarShape
    //draws tabbar shape
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        addShape()
    }
    
    private func addShape () {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.fillColor = color?.cgColor ?? UIColor.white.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: -2);
        shapeLayer.shadowOpacity = 0.21
        shapeLayer.shadowRadius = 8
        shapeLayer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radii).cgPath
        
        
        //checks if there is already a shape to replace
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    //bezeir path
    private func createPath () -> CGPath{
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: radii, height: 0.0))
        return path.cgPath
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        
        var tabFrame = self.frame
        tabFrame.size.height = 65 + self.safeAreaInsets.bottom
        tabFrame.origin.y = self.frame.origin.y + self.frame.height - 65 - self.safeAreaInsets.bottom
        self.layer.cornerRadius = 18
        self.frame = tabFrame
        
        self.items?.forEach({
            $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -0.5)
        })
        
    }
}
