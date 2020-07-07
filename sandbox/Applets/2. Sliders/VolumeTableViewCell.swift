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
    
    
    @IBOutlet weak var bigVol: UIImageView!
    
    @IBOutlet weak var lilVol: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //volume = Int(volumeSlider.value)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        bigVol.image = (bigVol.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        lilVol.image = (lilVol.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        bigVol.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        lilVol.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
       
        // tintedImage2.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)

        // Configure the view for the selected state
    }
}
