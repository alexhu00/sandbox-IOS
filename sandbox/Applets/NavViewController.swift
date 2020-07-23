//
//  NavViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-19.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
          return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
          return false
    }
}
