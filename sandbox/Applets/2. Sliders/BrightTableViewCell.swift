//
//  BrightTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-29.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class BrightTableViewCell: UITableViewCell {
    
    // MARK: Properties

    @IBOutlet weak var brightSlider: UISlider!
    
    var a11y = settings.a11yIsOn
    
    @IBOutlet weak var lilBright: UIImageView!
    
    @IBOutlet weak var bigBright: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        if (a11y) {
            setA11yViolations()
        }
        else{
            setA11yCorrect()
        }
        
        // Update the brightness SLIDER to the value that was last set by user
        let defaults = UserDefaults.standard
        if (defaults.bool(forKey: keys.brightChanged)){
            brightSlider.value = defaults.float(forKey: keys.brightLevel)
        }
    }
    
    
    // MARK: Functions

    func setA11yCorrect() {
        brightSlider.isAccessibilityElement = true
        brightSlider.accessibilityLabel = "Brightness"
        brightSlider.accessibilityHint = "Slide right to increase the brightness"
        print("a11y true")
    }
    
    func setA11yViolations() {
        brightSlider.isAccessibilityElement = true
        brightSlider.accessibilityLabel = "Slider"
        brightSlider.accessibilityHint = "Slide"
        print("a11y false")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        bigBright.image = (bigBright.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        lilBright.image = (lilBright.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        bigBright.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        lilBright.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
    }
    
}
