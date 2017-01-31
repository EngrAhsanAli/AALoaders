//
//  AADialogLoader.swift
//  AALoaders
//
//  Created by Engr. Ahsan Ali on 25/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

/// AADialogLoader class
/// Extended from NSObject
/// Main class for AADialogLoader responsible to show and hide progress view
class AADialogLoader: NSObject {
    
    /// Alert View Controller
    lazy var alertController: UIAlertController = { [unowned self] in
        let alert = UIAlertController(title: self.options.title, message: self.messageString, preferredStyle: .alert)
        return alert
        }()
    
    /// Dialog indicator view
    lazy var indicator: UIActivityIndicatorView = { [unowned self] in
        let indicator = self.view.activityIndicator
        indicator.indicatorColor(self.options.loaderColor)
        indicator.startAnimating()
        return indicator
        }()
    
    /// Dialog options
    var options: AADialogOptions
    
    /// Message String with blank spaces for indicator
    var messageString: String {
        
        if let message = self.options.message {
            let blankSpaces = String(repeating: "\n", count: 2)
            return "\(message)\(blankSpaces)"
        }
        return "\n"
    }
    
    /// Bottom constant for indicator
    var bottomConstant: CGFloat {
        return alertController.actions.count == 0 ? -10 : -50
    }
    
    /// AADialogLoader cancel listner
    var dialogDidCancel: (() -> Void)?
    
    /// UIWindow root view controller
    var rootViewController: UIViewController {
        guard let root = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError("AALoaders - Application key window not found. Please check UIWindow in AppDelegate.")
        }
        
        return root
    }
    
    
    /// AADialogLoader init with options
    ///
    /// - Parameter options: AADialogOptions for customization
    init(_ options: AADialogOptions) {
        self.options = options
        super.init()
        
        view.addSubview(indicator)

        setOptions()
    }
    

    /// Set autolayout for indicator
    func setAutoLayout() {
        
        let centerX = NSLayoutConstraint(item: indicator,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .centerX,
                                         multiplier: 1,
                                         constant: 0)
        
        let bottom = NSLayoutConstraint(item: indicator,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: view,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: bottomConstant)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([centerX, bottom])

    }
    
    /// Show loader indicator
    ///
    /// - Parameter time: deadline for dismiss (optional)
    func showLoader(forTime time: Double?) {
        setAutoLayout()
        rootViewController.present(alertController, animated: true) {
            self.hideLoader(withTime: time)
        }
    }
    
    /// Show loader indicator
    ///
    /// - Parameters:
    ///   - time: deadline for dismiss (optional)
    ///   - cancelTitle: Allow cancel with title
    ///   - dialogDidCancel: Closure for cancel dialog
    func showLoader(forTime time: Double?, withCancel cancelTitle: String, dialogDidCancel: (() -> Void)?) {
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler:{ _ in
            dialogDidCancel?()
        })
        alertController.addAction(cancelAction)
        
        showLoader(forTime: time)
        
    }
    
    /// Dismiss dialog
    func hideLoader() {
        alertController.dismiss(animated: true, completion: nil)
    }
    
    /// Dismiss dialog with time
    ///
    /// - Parameter time: deadline for dismiss (Optional)
    func hideLoader(withTime time: Double?) {
        if let hideTime = time {
            let when: DispatchTime = .now() + hideTime
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.hideLoader()
            }
        }
    }
}

// MARK: - AADialogLoader+UIAlertController
extension AADialogLoader {
    
    /// AlertView view
    var view: UIView {
        return alertController.view
    }
}

// MARK: - Customisation
extension AADialogLoader {
    

    /// Set options for customization of dialog view
    func setOptions() {
        
        let subview1 = view.subviews.first!
        let subview2 = subview1.subviews.first!
        let contentView = subview2.subviews.first!
        
        /// Background color
        if let backgroundColor = self.options.backgroundColor {
            contentView.backgroundColor = backgroundColor
        }
        
        /// Corner radius
        if let cornerRadius = self.options.cornerRadius {
            subview1.layer.cornerRadius = cornerRadius
        }
        
        /// Border width
        if let borderWidth = self.options.borderWidth {
            subview1.layer.borderWidth = borderWidth
        }
        
        /// Border color
        if let borderColor = self.options.borderColor {
            subview1.layer.borderColor = borderColor.cgColor
        }
        
        /// Cancel button color
        if let tintColor = self.options.cancelColor {
            view.tintColor = tintColor
        }
        
        /// Shadow color (default is none)
        if let shadowColor = self.options.shadowColor {
            subview1.addShadow(shadowColor)
        }
        
        /// Blur effect
        if let blurEffect = self.options.blurEffect {
            view.applyVisualEffect(blurEffect)
        }
        
        
        /// Attributed Title
        if
            let title = self.options.title,
            let attr = self.options.titleAttributes {
            
            let titleAttributed = NSAttributedString(
                string: title,
                attributes: attr)
            alertController.setValue(titleAttributed, forKey: "attributedTitle")
            
        }
        
        /// Attributed Message
        if
            let attr = self.options.messageAttributes {
            
            let messageAttributed = NSAttributedString(
                string: messageString,
                attributes: attr)
            
            alertController.setValue(messageAttributed, forKey: "attributedMessage")
            
            
        }
        
    }
    
}
