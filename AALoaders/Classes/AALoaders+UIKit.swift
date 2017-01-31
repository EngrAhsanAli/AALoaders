//
//  AALoaders+UIKit.swift
//  AALoaders
//
//  Created by Engr. Ahsan Ali on 27/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

/// Global Identifiers

fileprivate var id_AAButtonLoader = "AAButtonLoader"
fileprivate var id_AANavigationLoader = "AANavigationLoader"
fileprivate var id_AADialogLoader = "AADialogLoader"

// MARK: - UIButton+AAButtonLoader

extension UIButton {
    
    /// Toggle button indicator with options
    ///
    /// - Parameters:
    ///   - position: LoaderPosition loader postion in button
    ///   - options: AAIndicatorOptions parameter (optional)
    open func aa_toggleLoader(_ options: AAButtonOptions = AAButtonOptions()) {
        
        var progressLoader: AAButtonLoader!
        
        if let loader = objc_getAssociatedObject(self,  &id_AAButtonLoader)
            as? AAButtonLoader {
            objc_removeAssociatedObjects(loader)
            progressLoader = loader
        }
        else {
            progressLoader = AAButtonLoader(self, withOptions: options)
            objc_setAssociatedObject(self, &id_AAButtonLoader, progressLoader, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        progressLoader.toggleLoader()
    }
    
}


// MARK: - UIImageView+AAImageLoader

extension UIImageView {
    
    /// Sets image with animation after downloading
    
    ///
    /// - Parameters:
    ///   - url: url to download
    ///   - options: AAIndicatorOptions for activity indicator
    open func aa_setImage(url: URL, withOptions options: AAImageOptions = AAImageOptions()) {
        let loader = AAImageLoader(self, path: url, withOptions: options)
        loader.setImage()
    }
    
    /// Sets image with animation after downloading
    ///
    /// - Parameters:
    ///   - string: url string to download
    ///   - options: AAIndicatorOptions for activity indicator
    open func aa_setImage(string: String, withOptions options: AAImageOptions = AAImageOptions()) {
        guard let imageURL = URL(string: string) else { return }
        aa_setImage(url: imageURL, withOptions: options)
    }
    
}


// MARK: - UINavigationController+AANavigationLoader

extension UINavigationController {
    
    /// Show Navigation Progress Loader
    ///
    /// - Parameter options: AANavigationOptions (optional)
    open func aa_showLoader(_ options: AANavigationOptions = AANavigationOptions()) {
        
        self.aa_hideLoader(nil)
        let progressLoader = AANavigationLoader(self, withOptions: options)
        objc_setAssociatedObject(self, &id_AANavigationLoader, progressLoader, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        progressLoader.showLoader()
        
    }
    
    /// Hide Navigation Progress Loader
    ///
    /// - Parameter cancel: bool for cancel or complete
    open func aa_hideLoader(_ cancel: Bool?) {

        if let loader = objc_getAssociatedObject(self,  &id_AANavigationLoader)
            as? AANavigationLoader {
            objc_removeAssociatedObjects(loader)
            if let complete = cancel {
                loader.hideLoader(complete)
            }
            else {
                loader.removeLoader()
            }
        }
    }
    
}

// MARK: - UIResponder+AADialogLoader

extension UIResponder {
    fileprivate func getLoader(_ options: AADialogOptions) -> AADialogLoader {
        
        self.aa_hideDialog()
        let progressLoader = AADialogLoader(options)
        objc_setAssociatedObject(self, &id_AADialogLoader, progressLoader, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return progressLoader
        
    }
    
    open func aa_showLoader(deadline: Double? = nil, options: AADialogOptions = AADialogOptions()) {
        let progressLoader = getLoader(options)
        progressLoader.showLoader(forTime: deadline)
    }
    
    open func aa_showLoader(deadline: Double?, options: AADialogOptions = AADialogOptions(), withCancel cancelTitle: String, dialogDidCancel: (() -> Void)?) {
        let progressLoader = getLoader(options)
        progressLoader.showLoader(forTime: deadline, withCancel: cancelTitle, dialogDidCancel: dialogDidCancel)
    }
    
    open func aa_hideDialog() {
        if let loader = objc_getAssociatedObject(self,  &id_AADialogLoader)
            as? AADialogLoader {
            objc_removeAssociatedObjects(loader)
            loader.hideLoader()
        }
    }
}


