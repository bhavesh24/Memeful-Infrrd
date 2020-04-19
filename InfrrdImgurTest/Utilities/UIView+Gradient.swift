//
//  UIView+Gradient.swift
//  Memeful
//
//  Created by Bhavesh on 18/04/20.
//  Copyright © 2020 Bhavesh. All rights reserved.
//

import UIKit

extension UIView {
    func setGradient(topGradientColor: UIColor? = UIColorHelper().hexStringToColor(hex: "#1F7398"), bottomGradientColor: UIColor? = UIColorHelper().hexStringToColor(hex: "#14A365")) {
        let gradientLayer = CAGradientLayer()

        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            gradientLayer.locations = [0.0, 0.70, 1]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }

    func removeGradient() {
        if layer.sublayers!.count > 0 {
            for sublayer in layer.sublayers! {
                if sublayer is CAGradientLayer {
                    sublayer.removeFromSuperlayer()
                }
            }
        }
    }

    func setTopGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        let gradientLayer = CAGradientLayer()

        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            gradientLayer.locations = [0.0, 1]
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }

    func blurImage() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.4
        blurEffectView.frame = bounds

        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        addSubview(blurEffectView)
    }

    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    func addDashedBorder() {
        // Create a CAShapeLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColorHelper().hexStringToColor(hex: "#35BAE4").cgColor
        shapeLayer.lineWidth = 2
        // passing an array with the values [2,3] sets a dash pattern that alternates between a 2-user-space-unit-long painted segment and a 3-user-space-unit-long unpainted segment
        shapeLayer.lineDashPattern = [4, 5]

        let path = CGMutablePath()
        path.addLines(between: [
            CGPoint(x: 0, y: 0),
            CGPoint(x: frame.width, y: 0)
        ])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
