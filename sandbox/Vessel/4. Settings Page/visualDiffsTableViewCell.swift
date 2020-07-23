//
//  visualDiffsTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-20.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class visualDiffsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var toggle: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        toggle.isOn = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func visualDiffsToggle(_ sender: UISwitch) {
        settings.visualDiffsOn = toggle.isOn
    }
    
}
