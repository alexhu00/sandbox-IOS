//
//  VolumeTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-29.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

var initialValue: Float = 0.50

class VolumeTableViewCell: UITableViewCell {
    
    // MARK: Properties

    @IBOutlet weak var volumeSlider: UISlider!
    
    lazy var volume = Int(volumeSlider.value)
    
    var a11y = settings.a11yIsOn
    
    @IBOutlet weak var bigVol: UIImageView!
    
    @IBOutlet weak var lilVol: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        volumeSlider.value = initialValue
        print("RAN")
        if (a11y) {
            setA11yViolations()
        }
        else{
            setA11yCorrect()
        }
    }
    
    // MARK: Functions
    
    func setA11yCorrect() {
        //volumeSlider.value = initialValue
        volumeSlider.isAccessibilityElement = true
        volumeSlider.accessibilityLabel = "Volume"
        volumeSlider.accessibilityHint = "Slide right to increase the volume"
        print("a11y true")
    }
    
    func setA11yViolations() {
        //volumeSlider.value = initialValue
        volumeSlider.isAccessibilityElement = true
        volumeSlider.accessibilityLabel = "Slider"
        volumeSlider.accessibilityHint = "Slide"
        print("a11y false")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        initialValue = volumeSlider.value
        print(initialValue)
        print("hi")
        bigVol.image = (bigVol.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        lilVol.image = (lilVol.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        bigVol.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        lilVol.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
    }
    
}
