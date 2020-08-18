//
//  SuccessViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-29.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class SuccessViewController: UIViewController {
    
    // MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Functions
    
    @IBAction func exitApplet(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToHome", sender: self)
        Analytics.shared().track("1: Applet Exited")
    }
    
}
