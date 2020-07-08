//
//  a11yTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-02.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class a11yTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var a11yToggle: UISwitch!
    
    
    // MARK: Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        a11yToggle.isOn = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func a11yToggleTouched(_ sender: UISwitch) {
        print("touched!")
        settings.a11yIsOn = a11yToggle.isOn
    }
}


       //a11y = settings.a11yIsOn
       /*
       if (a11yToggle.isOn == true)
       {
           settings.a11yIsOn = true
           print("set to \(settings.a11yIsOn)")
       }
       else{
           settings.a11yIsOn = false
           print("set to \(settings.a11yIsOn)")
       }
*/
