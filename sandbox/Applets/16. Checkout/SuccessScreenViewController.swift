//
//  SuccessScreenViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-08.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class SuccessScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.shared().track("16: Success Screen Shown")
    }
    
    @IBAction func unwind(_ sender: Any) {
        Analytics.shared().track("16: Applet Exited")
        performSegue(withIdentifier: "unwindHome", sender: self)
    }
    
    
    

}
