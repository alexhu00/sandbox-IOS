//
//  BrightTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-29.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class BrightTableViewCell: UITableViewCell {

    @IBOutlet weak var brightSlider: UISlider!
    
    var brightness: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        brightness = Int(brightSlider.value)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
