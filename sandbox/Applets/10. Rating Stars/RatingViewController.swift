//
//  RatingViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-20.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {

    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ratingControl)
        cardView.layer.cornerRadius = 10
    }
    

}
