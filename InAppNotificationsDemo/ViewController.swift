//
//  ViewController.swift
//  InAppNotificationsDemo
//
//  Created by Kittitat Rodphotong on 1/25/2560 BE.
//  Copyright © 2560 DevGo. All rights reserved.
//

import UIKit
import BRYXBanner

class ViewController: UIViewController {
    // MARK: - IBOutlet
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let banner = Banner(title: "Image Notification",
                            subtitle: "Here's a great image notification.",
                            image: UIImage(named: "Icon"),
                            backgroundColor: UIColor(red:48.00/255.0, green:174.0/255.0, blue:51.5/255.0, alpha:1.000))
        banner.dismissesOnTap = true
        banner.show(duration: 3.0)
    }
}

