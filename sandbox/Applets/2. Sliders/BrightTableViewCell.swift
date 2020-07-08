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
    
    var brightness: Int = 0
    
    var a11y = settings.a11yIsOn
    
    @IBOutlet weak var lilBright: UIImageView!
    
    @IBOutlet weak var bigBright: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        brightness = Int(brightSlider.value)
        if (a11y) {
            setA11y1()
        }
        else{
            setA11y2()
        }
    }
    
    
    // MARK: Functions

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        bigBright.image = (bigBright.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        lilBright.image = (lilBright.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        bigBright.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        lilBright.tintColor = .init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
    }
    
    func setA11y1() {
        brightSlider.isAccessibilityElement = true
        brightSlider.accessibilityLabel = "Brightness"
        print("a11y true")
    }
    
    func setA11y2() {
        brightSlider.isAccessibilityElement = true
        brightSlider.accessibilityLabel = "Slider"
        print("a11y false")
    }
    
}
