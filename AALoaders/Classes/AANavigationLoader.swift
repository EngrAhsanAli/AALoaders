//
//  AANavigationLoader.swift
//  AALoaders
//
//  Created by Engr. Ahsan Ali on 11/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

/// AANavigationLoader class
/// Extended from NSObject
/// Main class for AANavigationLoader responsible to show and hide progress view for given UINavigationController

class AANavigationLoader: NSObject {

    /// Navigation controller instance
    let navigationController: UINavigationController
    
    /// AANavigationOptions instance
    var options: AANavigationOptions
    
    /// ProgressView with settings
    lazy var progressBarView: UIProgressView = { [unowned self] in
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.progressTintColor = self.options.barProgressColor
        progressView.trackTintColor = self.options.barBackgroundColor
        progressView.transform = CGAffineTransform(scaleX: 1.0, y: self.options.barHeight)
        self.navigationController.view.addSubview(progressView)
        let navBar = self.navigationController.navigationBar
        let bottomConstraint = NSLayoutConstraint(item: navBar, attribute: .bottom, relatedBy: .equal, toItem: progressView, attribute: .bottom, multiplier: 1, constant: self.options.barHeight)
        let leftConstraint = NSLayoutConstraint(item: navBar, attribute: .leading, relatedBy: .equal, toItem: progressView, attribute: .leading, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: navBar, attribute: .trailing, relatedBy: .equal, toItem: progressView, attribute: .trailing, multiplier: 1, constant: 0)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        self.navigationController.view.addConstraints([bottomConstraint, leftConstraint, rightConstraint])
        return progressView
    }()
    
    /// Timer for schedule the progress update
    var timer: Timer!
    var _timer: Timer {
        get {
            return Timer.scheduledTimer(timeInterval: 0.01,
                                        target: self,
                                        selector: #selector(AANavigationLoader.updateProgressWithTime(timer:)),
                                        userInfo: nil,
                                        repeats: true)
        }
    }

    
    /// Init for UINavigationController with options
    ///
    /// - Parameters:
    ///   - navigationController: navigation controller
    ///   - options: AANavigationOptions (optional)
    init(_ navigationController: UINavigationController, withOptions options: AANavigationOptions) {
        self.navigationController = navigationController
        self.options = options
        super.init()
    }
    
    /// Show the progress in navigation
    func showLoader() {
        timer = _timer
    }

    /// Remove the progress in navigation
    func removeLoader() {
        if let progressTimer = timer {
            progressTimer.invalidate()
            progressBarView.removeFromSuperview()
        }
    }
    
    /// Hide the loader with animation
    ///
    /// - Parameter cancel: bool for complete or cancel the progress update
    func hideLoader(_ cancel: Bool) {

        guard let progressTimer = timer else {
            return
        }
        
        UIView.animate(withDuration: 1.5, animations: {
            let value: Float = cancel ? 0.0 : 1.0
            progressTimer.invalidate()
            self.progressBarView.setProgress(value , animated: true)
            self.progressBarView.alpha = 0.1
        }, completion: { _ in
            self.progressBarView.removeFromSuperview()
        })

    }
    
    /// Selector for update progress after specified time interval
    ///
    /// - Parameter timer: timer instance
    @objc func updateProgressWithTime(timer: Timer) {
        
        // Should stop the progress update when reach the max progress allowed
        guard progressBarView.progress <= options.maxProgress else {
            timer.invalidate()
            return
        }
        // Progress update with animation
        let time = progressBarView.progress + options.progressStep
        progressBarView.setProgress(time, animated: true)
    }
    

}
