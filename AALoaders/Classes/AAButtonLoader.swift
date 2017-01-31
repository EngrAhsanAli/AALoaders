//
//  AAButtonLoader.swift
//  AALoaders
//
//  Created by Engr. Ahsan Ali on 09/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

/// AAButtonLoader class
/// Extended from NSObject
/// Main class for AAButtonLoader responsible to show and hide activity indicator for given UIButton
class AAButtonLoader: NSObject {

    /// Button instance
    var button: UIButton
    
    /// Indicator position
    var position: LoaderPosition
    
    /// AAButtonOptions options
    var options: AAButtonOptions

    /// Button indicator view
    lazy var indicator: UIActivityIndicatorView = { [unowned self] in
        let indicator = self.button.activityIndicator
        indicator.indicatorScale(self.boundsValue)
        
        var color: UIColor = self.options.color ?? self.currentTitleColor
        indicator.indicatorColor(color)
        
        indicator.center = CGPoint(x: self.originX, y: self.bounds.midY)
        
        return indicator
    }()

    /// Indicator position originX calculation
    var originX: CGFloat {
        
        switch position {
        case .middle:
            return bounds.midX
        case .left:
            return intrinsicContentSize.width
        case .right:
            return (bounds.maxX - intrinsicContentSize.width)
        case .before:
            return (bounds.midX - intrinsicContentSize.width)
        case .after:
            return (bounds.midX + intrinsicContentSize.width)
        }
        
    }
    
    /// AAButtonLoader init with button
    ///
    /// - Parameters:
    ///   - btn: button instance
    ///   - options: indicator options
    init(_ btn: UIButton, withOptions options: AAButtonOptions) {
        self.button = btn
        self.options = options
        self.position = options.position
        
        super.init()
        
        self.button.addSubview(indicator)
        
    }
    
    /// Toggle title text
    /// Allow only if the position of indicator is in middle
    /// - Parameter hide: bool for hide
    func toggleTitleOpacity(_ hide: Bool) {
        guard position == .middle else {
            return
        }
        if position == .middle {
            titleLabel?.layer.opacity = hide ? 0 : 1
        }
    }

    /// Toggle button indicator
    func toggleLoader() {
        toggleTitleOpacity(indicator.isHidden)
        indicator.isHidden = !indicator.isHidden
        if indicator.isHidden {
            indicator.stopAnimating()
        }
        else {
            indicator.startAnimating()
        }
    }

}

// MARK: - AAButtonLoader+UIButton
extension AAButtonLoader {
    
    /// button bounds
    var bounds: CGRect {
        return button.bounds
    }
    
    /// Button content size
    var intrinsicContentSize: CGSize {
        return button.intrinsicContentSize
    }
    
    /// Button text color
    var currentTitleColor: UIColor {
        return button.currentTitleColor
    }
    
    /// Button bounds value
    var boundsValue: CGFloat {
        return button.boundsValue
    }
    
    /// Button title
    var titleLabel: UILabel? {
        return button.titleLabel
    }
}

/// Loader Position in UIButton
///
/// - middle: Center
/// - left: left most
/// - right: right most
/// - before: before button title
/// - after: after button title
public enum LoaderPosition {
    case middle
    case left
    case right
    case before
    case after
    
}
