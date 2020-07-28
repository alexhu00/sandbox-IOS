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
    
    var a11y = settings.a11yIsOn
    
    @IBOutlet weak var bigVol: UIImageView!
    
    @IBOutlet weak var lilVol: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        print("RAN")
        if (a11y) {
            setA11yViolations()
        }
        else{
            setA11yCorrect()
        }
        // Update the volume SLIDER to the value that was last set by user
        let defaults = UserDefaults.standard
        if (defaults.bool(forKey: keys.volumeChanged)){
            volumeSlider.value = defaults.float(forKey: keys.volumeLevel)
        }
    }
    
    // MARK: Functions
    
    func setA11yCorrect() {
        volumeSlider.isAccessibilityElement = true
        volumeSlider.accessibilityLabel = "Volume"
        volumeSlider.accessibilityHint = "Slide right to increase the volume"
        print("a11y true")
    }
    
    func setA11yViolations() {
        volumeSlider.isAccessibilityElement = true
        volumeSlider.accessibilityLabel = "Slider"
        volumeSlider.accessibilityHint = "Slide"
        print("a11y false")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        bigVol.image = (bigVol.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        lilVol.image = (lilVol.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        bigVol.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        lilVol.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
    }
    
}
