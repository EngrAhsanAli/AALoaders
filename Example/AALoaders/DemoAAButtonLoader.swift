//
//  DemoAAButtonLoader.swift
//  AALoaders
//
//  Created by Engr. Ahsan Ali on 12/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

import UIKit
import AALoaders

class DemoAAButtonLoader: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showHide(_ sender: UIButton, color: UIColor, position: LoaderPosition) {
        
        let options = AAButtonOptions()
        options.color = color
        options.position = position
        sender.aa_toggleLoader(options)
    }
    
    
    @IBAction func rightAction(_ sender: UIButton) {
        showHide(sender, color: .orange, position: .right)
    }
    @IBAction func middleAction(_ sender: UIButton) {
        showHide(sender, color: .white, position: .middle)
    }

    @IBAction func leftAction(_ sender: UIButton) {
        showHide(sender, color: .blue, position: .left)
    }
    
    @IBAction func beforeAction(_ sender: UIButton) {
        showHide(sender, color: .magenta, position: .before)
    }
    
    @IBAction func afterAction(_ sender: UIButton) {
        showHide(sender, color: .cyan, position: .after)
    }
    
}
