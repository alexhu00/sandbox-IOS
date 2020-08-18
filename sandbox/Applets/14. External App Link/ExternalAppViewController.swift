//
//  ExternalAppViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-07.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class ExternalAppViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func link(_ sender: UIButton) {
        Analytics.shared().track("14: Link Pressed")
        let walletHooks = "shoebox://"
        let walletUrl = NSURL(string: walletHooks)
        if UIApplication.shared.canOpenURL(walletUrl! as URL)
        {
            UIApplication.shared.openURL(walletUrl! as URL)

         } else {
            //redirect to safari because the user doesn't have Apple Wallet
            UIApplication.shared.openURL(NSURL(string: "http://safari.com/")! as URL)
        }
    }
    
    
}
