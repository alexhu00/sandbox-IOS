//
//  SelectedViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-11.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class SelectedViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var input: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = input
    }
    
}
