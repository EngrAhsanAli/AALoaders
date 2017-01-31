//
//  DemoAAImageLoader.swift
//  AALoaders
//
//  Created by Engr. Ahsan Ali on 27/01/2017.
//  Copyright © 2017 AA-Creations. All rights reserved.
//

import UIKit
import  AALoaders

class DemoAAImageLoader: UITableViewController {

    var urls: [String] {
        return [
            "http://1077thejewel.com/wp-content/uploads/iphone-6s-plus-home-screen-hero.jpg",
            "http://103gsm.by/images/news/iphone.jpg",
            "http://www.gsmdome.com/wp-content/uploads/2015/11/Apple-iPhone6s-Plus_054-660x495.jpg",
            "https://i.ytimg.com/vi/pzetx77KwJk/maxresdefault.jpg",
            "http://cdn.gsmarena.com/imgroot/reviews/16/apple-iphone-se/lifestyle/-728w2/gsmarena_002.jpg",
            "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png",
            "http://images.apple.com/v/home/dd/images/gallery/iphone_alt_large_2x.jpg",
            "http://images.apple.com/v/home/dd/images/gallery/watch_alt_large_2x.jpg",
            "http://images.apple.com/v/home/dd/images/gallery/macbookpro_large_2x.jpg"
        ]
    }
    
    var colors: [UIColor] {
        return [
            .red,
            .black,
            .darkGray,
            .green,
            .white,
            .blue,
            .magenta,
            .yellow,
            .orange,
            .purple,
            .brown,
            .cyan
        ]
    }
    
    
    var randColor: UIColor {
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        return colors[randomIndex]
    }
    
    var randImage: String {
        let randomIndex = Int(arc4random_uniform(UInt32(urls.count)))
        return urls[randomIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func refreshAction(_ sender: Any) {
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let imageView = cell.viewWithTag(100) as! UIImageView
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
        
        let options = AAImageOptions()
        options.color = randColor
        imageView.aa_setImage(string: randImage, withOptions: options)

        return cell
    }
 
}
