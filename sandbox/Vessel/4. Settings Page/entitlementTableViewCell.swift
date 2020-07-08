//
//  entitlementTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-02.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class entitlementTableViewCell: UITableViewCell {
    
    // MARK: Properties

    @IBOutlet weak var entitlementToggle: UISwitch!
    
    
    // MARK: Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //entitlementToggle.isOn = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func entitlementToggleTouched(_ sender: UISwitch) {
    }
}
