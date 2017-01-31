//
//  AAImageLoader.swift
//  AALoaders
//
//  Created by Engr. Ahsan Ali on 11/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

/// AAImageLoader class
/// Extended from NSObject
/// Main class for AAImageLoader responsible to download and set image with activity indicator for given UIImageView
class AAImageLoader: NSObject {
    
    /// ImageView instance
    let imageView: UIImageView
    
    /// Image Url instance
    let imageURL: URL
    
    /// Indicator options
    var options: AAImageOptions
    
    /// Activity Loader intance

    lazy var indicator: UIActivityIndicatorView = { [unowned self] in
        let indicator = self.imageView.activityIndicator
        indicator.indicatorScale(self.boundsValue)
        indicator.indicatorColor(self.options.color)
        indicator.startAnimating()
        
        return indicator
        }()
    
    /// AAImageLoader init
    /// Gets UIImageView and responsible to download and set image with Loading
    ///
    /// - Parameters:
    ///   - imageView: UIImageView to set image with animation
    ///   - url: URL to download image
    ///   - options: AAIndicatorOptions instance (optional)
    init(_ imageView: UIImageView, path url: URL, withOptions options: AAImageOptions) {
        self.imageView = imageView
        self.imageURL = url
        self.options = options
        
        super.init()
        
        self.imageView.addSubview(indicator)
        setAutoLayout()
    }
    
    /// Set autolayout for indicator
    func setAutoLayout() {
        
        let centerX = NSLayoutConstraint(item: indicator,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: imageView,
                                         attribute: .centerX,
                                         multiplier: 1,
                                         constant: 0)
        
        let centerY = NSLayoutConstraint(item: indicator,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: imageView,
                                         attribute: .centerY,
                                         multiplier: 1,
                                         constant: 0)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        imageView.addConstraints([centerX, centerY])
    }
    
    /// Set image after downloading
    func setImage() {
        downloadImage() { (img) in
            self.showWithAnimation(img)
        }
    }
    
    /// Show image in UIImageView after downloading it
    ///
    /// - Parameter img: image to show in UIImageView
    func showWithAnimation(_ img: UIImage?) {
        guard let image = img else {
            return
        }
        
        self.indicator.stopAnimating()
        self.indicator.removeFromSuperview()
        
        UIView.transition(with: self.imageView,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.imageView.image = image
        },
                          completion: nil)
    }
    
    /// Download specific image from URL
    ///
    /// - Parameters:
    ///   - url: URL to download image
    ///   - completion: closure for completion
    func downloadImage(_ completion: @escaping ((UIImage?) -> ())) {
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            
            var img: UIImage? = nil
            
            if let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data) {
                img = image
            }
            
            DispatchQueue.main.async() { () -> Void in
                completion(img)
            }
            
            }.resume()
    }
    
}


// MARK: - AAImageLoader+UIImageView
extension AAImageLoader {
    
    /// Button bounds value
    var boundsValue: CGFloat {
        return imageView.boundsValue
    }
    
    
}


