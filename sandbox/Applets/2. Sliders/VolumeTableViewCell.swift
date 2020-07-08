//
//  VolumeTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-29.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class VolumeTableViewCell: UITableViewCell {
    
    // MARK: Properties

    @IBOutlet weak var volumeSlider: UISlider!
    
    lazy var volume = Int(volumeSlider.value)
    
    var a11y = settings.a11yIsOn
    
    @IBOutlet weak var bigVol: UIImageView!
    
    @IBOutlet weak var lilVol: UIImageView!
    
    // MARK: Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if (a11y) {
            setA11y1()
        }
        else{
            setA11y2()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        bigVol.image = (bigVol.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        lilVol.image = (lilVol.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        bigVol.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        lilVol.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
    }
    
    func setA11y1() {
        volumeSlider.isAccessibilityElement = true
        volumeSlider.accessibilityLabel = "Volume"
        print("a11y true")
    }
    
    func setA11y2() {
        volumeSlider.isAccessibilityElement = true
        volumeSlider.accessibilityLabel = "Slider"
        print("a11y false")
    }
    
}
