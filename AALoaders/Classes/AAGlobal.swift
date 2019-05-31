//
//  AAGlobal.swift
//  AALoaders
//
//  Created by Engr. Ahsan Ali on 12/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

/// AAGlobal Extensions

// MARK: - UIView
extension UIView {
    
    /// Adds indicator in given view
    var activityIndicator: UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.center = CGPoint(x: bounds.midX, y: bounds.midY)
        indicator.sizeToFit()
        return indicator
    }
    
    /// Indicator size calculation in given view bounds
    var boundsValue: CGFloat {
        
        let width = bounds.width
        let height = bounds.height
        let size: CGFloat = width < height ? width : height
        return size/70
    }
    
    
    /// Adds UIBlurEffect for given view
    ///
    /// - Parameter style: UIBlurEffectStyle style
    func applyVisualEffect(_ style: UIBlurEffect.Style) {
        guard let visualEffectView = self as? UIVisualEffectView else {
            subviews.forEach({$0.applyVisualEffect(style)})
            return
        }
        visualEffectView.effect = UIBlurEffect(style: style)
    }
    
    
    /// Add shadow for given view and color
    ///
    /// - Parameter color: shadow color
    func addShadow( _ color: UIColor) {
        
        layer.shadowColor = color.cgColor
        layer.shadowRadius = 7.0
        layer.shadowOffset = CGSize.zero
        layer.masksToBounds = false
        
        let shadowAnim = CABasicAnimation()
        shadowAnim.keyPath = "shadowOpacity"
        shadowAnim.fromValue = NSNumber(value: 0.0)
        shadowAnim.toValue = NSNumber(value: 0.9)
        shadowAnim.duration = 2.0
        
        layer.add(shadowAnim, forKey: "shadowOpacity")
        layer.shadowOpacity = 0.9
    }
    
}

// MARK: - UIActivityIndicatorView
extension UIActivityIndicatorView {
    
    /// Indicator scale
    ///
    /// - Parameter size: scale
    func indicatorScale(_ size: CGFloat) {
        transform = CGAffineTransform(scaleX: size, y: size)
    }
    
    /// Indicator color
    ///
    /// - Parameter color: color
    func indicatorColor(_ color: UIColor) {
        self.color = color
    }
}







