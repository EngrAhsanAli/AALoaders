//
//  AAOptions.swift
//  AALoaders
//
//  Created by Engr. Ahsan Ali on 31/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

open class AAButtonOptions: NSObject {
    
    open var color: UIColor?
    
    open var position: LoaderPosition = .middle
}

open class AAImageOptions: NSObject {
    
    open var color: UIColor = .darkGray
    
}

open class AADialogOptions: NSObject {
    
    open var title: String?
    
    open var message: String?
    
    open var titleAttributes: Dictionary<String, Any>?
    
    open var messageAttributes: Dictionary<String, Any>?
    
    open var loaderColor: UIColor = .darkGray
    
    open var cancelColor: UIColor?
    
    open var cornerRadius: CGFloat?
    
    open var borderWidth: CGFloat?
    
    open var borderColor: UIColor?
    
    open var shadowColor: UIColor?
    
    open var blurEffect: UIBlurEffectStyle?
    
    open var backgroundColor: UIColor?
    
}


/// AANavigationLoader options
open class AANavigationOptions: NSObject {
    
    open var maxProgress: Float = 0.9
    
    open var barProgressColor: UIColor = .blue
    
    open var barBackgroundColor: UIColor?
    
    //
    // Computed Variables
    
    open var progressStep: Float = 0.0025 {
        didSet{
            if progressStep > 0.05 || progressStep < 0.0025 {
                progressStep = 0.0025
            }
        }
    }
    
    open var barHeight: CGFloat = 1 {
        didSet{
            if barHeight > 5 || barHeight < 1 {
                barHeight = 1
            }
        }
    }
    
}
