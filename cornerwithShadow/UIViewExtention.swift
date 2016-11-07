//
//  UIViewExtention.swift
//  SikkaNet2
//
//  Created by kvana inc on 29/04/16.
//  Copyright © 2016 Kvana. All rights reserved.
//

import UIKit
//import MBProgressHUD
class UIViewExtention: UIView {
}

extension UIView {
     func round(corners: UIRectCorner, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        let mask = _round(corners, radius: radius)
        addBorder(mask, borderColor: borderColor, borderWidth: borderWidth)
    }
    func round(corners: UIRectCorner, radius: CGFloat, shadowBorder: UIColor, shadowWidth: CGFloat) {
        let mask = _round(corners, radius: radius)
        addShadow(mask, shadowColor: shadowBorder, shadowWidth: shadowWidth)

    }
    
    func fullyRound(diameter: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = diameter / 2
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.CGColor;
    }
    
    func round(corners: UIRectCorner, radius: CGFloat, color: CGColor)-> CAShapeLayer {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
        return mask
    }
    
    
}

private extension UIView {
    
    func _round(corners: UIRectCorner, radius: CGFloat) -> CAShapeLayer {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
        return mask
    }
    
    func addBorder(mask: CAShapeLayer, borderColor: UIColor, borderWidth: CGFloat) {
        let borderLayer = CAShapeLayer()
        borderLayer.path = mask.path
        borderLayer.fillColor = UIColor.clearColor().CGColor
        borderLayer.strokeColor = borderColor.CGColor
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = bounds
        layer.addSublayer(borderLayer)
    }
    
    func _round(corners: UIRectCorner, radius: CGFloat, color: CGColor) -> CAShapeLayer {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
        
        
        
        layer.shadowOffset = CGSizeMake(0, 3);
        layer.shadowColor = UIColor.blackColor().CGColor;
        layer.shadowRadius = 2.0;
        layer.shadowOpacity = 0.35;
        layer.shadowPath = path.CGPath;
        
        let  bColor = backgroundColor!.CGColor;
        backgroundColor = nil;
        layer.backgroundColor =  bColor ;
        
        
        return mask
    }
    
    func addShadow(mask: CAShapeLayer, shadowColor: UIColor, shadowWidth: CGFloat){
        
        let shadowLayer = CAShapeLayer()
        
        shadowLayer.shadowColor = UIColor.greenColor().CGColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 10
        
        let bColor = backgroundColor!.CGColor;
        backgroundColor = nil;
        layer.backgroundColor =  bColor ;
        layer.insertSublayer(shadowLayer, atIndex: 0)
    }
    
}