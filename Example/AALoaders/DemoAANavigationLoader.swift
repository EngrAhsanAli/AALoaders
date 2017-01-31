//
//  DemoAANavigationLoader.swift
//  AALoaders
//
//  Created by Engr. Ahsan Ali on 12/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

import UIKit
import AALoaders

class DemoAANavigationLoader: UIViewController {

    
    let options = AANavigationOptions()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func showLoaderAction(_ sender: UIButton) {
        self.navigationController?.aa_showLoader(options)
    }
    
    @IBAction func cancelLoaderAction(_ sender: UIButton) {
        self.navigationController?.aa_hideLoader(true)
    }
    
    @IBAction func completeLoaderAction(_ sender: UIButton) {
        self.navigationController?.aa_hideLoader(false)
    }

    @IBAction func barAnimationAction(_ sender: UISlider) {
        options.progressStep = sender.value
        
    }
    @IBAction func barHeightAction(_ sender: UISlider) {
        options.barHeight = CGFloat(abs(sender.value))
        
    }
}
