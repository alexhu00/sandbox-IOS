//
//  LoadingScreenViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-22.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class LoadingScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        
    }
    
    @objc func timeToMoveOn() {
        self.performSegue(withIdentifier: "continue", sender: self)
    }

}
