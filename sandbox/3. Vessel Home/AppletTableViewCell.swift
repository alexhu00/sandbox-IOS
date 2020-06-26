//
//  AppletTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-24.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class AppletTableViewCell: UITableViewCell {

    @IBOutlet weak var appletIcon: UIImageView!
    
    @IBOutlet weak var appletLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
