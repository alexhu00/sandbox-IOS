//
//  DeviceRotationViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-06.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class DeviceRotationViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rotateScreen(_ sender: UIButton) {
        Analytics.shared().track("13: Device Rotated")
        
        var value = UIInterfaceOrientation.landscapeRight.rawValue
        
        if UIDevice.current.value(forKey: "orientation") as! Int == UIInterfaceOrientation.landscapeRight.rawValue {
            value = UIInterfaceOrientation.landscapeLeft.rawValue
            label.text = "Landscape Left"
        }
        
        else if UIDevice.current.value(forKey: "orientation") as! Int == UIInterfaceOrientation.landscapeLeft.rawValue {
             value = UIInterfaceOrientation.portrait.rawValue
            label.text = "Portrait"
         }
        else{
            value = UIInterfaceOrientation.landscapeRight.rawValue
            label.text = "Landscape Right"
        }
        
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.enableAllOrientation = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.enableAllOrientation = false

    let value = UIInterfaceOrientation.portrait.rawValue
    UIDevice.current.setValue(value, forKey: "orientation")

    }

}

/*
 else if UIDevice.current.value(forKey: "orientation") as! Int == UIInterfaceOrientation.portraitUpsideDown.rawValue {
     value = UIInterfaceOrientation.landscapeLeft.rawValue
 }
 */
