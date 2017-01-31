//
//  DemoAADialogLoader.swift
//  AALoaders
//
//  Created by Engr. Ahsan Ali on 27/01/2017.
//  Copyright © 2017 AA-Creations. All rights reserved.
//

import UIKit
import AALoaders

class DemoAADialogLoader: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var cancelOption: UISwitch!
    @IBOutlet weak var autoDismissOption: UISwitch!
    
    var titleText: String? {
        
        if let text = titleField.text {
            if text.isEmpty {
                return nil
            }
            return text
        }
        return nil
        
    }
    
    var msgText: String? {
        
        if let text = messageTextView.text {
            if text.isEmpty {
                return nil
            }
            return text
        }
        return nil
    }
    
    let bgColor = UIColor(red: 125.0/255, green: 162.0/255, blue: 133.0/255, alpha: 1.0)
    
    let borderColor = UIColor(red: 162.0/255, green: 117.0/255, blue: 54.0/255, alpha: 1.0)
    
    
    let loaderColor = UIColor(red: 205.0/255, green: 164.0/255, blue: 159.0/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLoader( _ options: AADialogOptions) {
        var dismissTime: Double?
        if autoDismissOption.isOn {
            dismissTime = 5
        }
        
        if cancelOption.isOn {
            self.aa_showLoader(deadline: dismissTime, options: options, withCancel: "Cancel") {
                print("Canceled!")
            }
        }
        else {
            self.aa_showLoader(deadline: dismissTime, options: options)
        }
    }
    
    @IBAction func displayAction(_ sender: Any) {
        
        
        let options = AADialogOptions()
        options.title = titleText
        options.message = msgText
        
        showLoader(options)
    }
    
    @IBAction func displayCustomisedAction(_ sender: Any) {
        
        let options = AADialogOptions()
        options.title = titleText
        options.message = msgText
        options.loaderColor = loaderColor
        options.cornerRadius = 5
        options.borderWidth = 3
        options.shadowColor = .black
        options.blurEffect = .light
        options.borderColor = borderColor
        options.backgroundColor = bgColor
        options.cancelColor = .darkGray
        
        let titleAttributes = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 18.0)! ]
        options.titleAttributes = titleAttributes
        
        let messageAttributes: Dictionary = [NSFontAttributeName: UIFont(name: "Avenir-Light", size: 13.0)!]
        options.messageAttributes = messageAttributes
        
        showLoader(options)

        
    }
}
