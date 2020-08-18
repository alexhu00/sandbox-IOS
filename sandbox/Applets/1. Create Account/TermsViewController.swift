//
//  TermsViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-13.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class TermsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delaysContentTouches = false
        Analytics.shared().track("1: Terms and Conditions Viewed")
    }

    @IBAction func dismiss(_ sender: UIButton) {
        Analytics.shared().track("1: Terms and Conditions Dismissed")
        dismiss(animated: true, completion: nil)
    }
}
