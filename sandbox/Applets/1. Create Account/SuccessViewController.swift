//
//  SuccessViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-29.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func exitApplet(_ sender: UIButton) {
            
        performSegue(withIdentifier: "unwindToHome", sender: self)
        
        
    }
    
}
