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
    
    @IBOutlet weak var lilBright: UIImageView!
    
    @IBOutlet weak var bigBright: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        brightness = Int(brightSlider.value)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        bigBright.image = (bigBright.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        lilBright.image = (lilBright.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        bigBright.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        lilBright.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        // Configure the view for the selected state
    }

}
