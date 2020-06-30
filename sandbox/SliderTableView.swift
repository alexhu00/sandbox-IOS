//
//  SliderTableView.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-29.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class SliderTableView: UITableView {

    
    @IBOutlet weak var slider2: UISlider!
    

    lazy var brightness = Int(slider2.value)
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
