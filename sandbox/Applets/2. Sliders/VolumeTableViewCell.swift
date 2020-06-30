//
//  VolumeTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-29.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class VolumeTableViewCell: UITableViewCell {

    @IBOutlet weak var volumeSlider: UISlider!
    
    lazy var volume = Int(volumeSlider.value)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //volume = Int(volumeSlider.value)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
