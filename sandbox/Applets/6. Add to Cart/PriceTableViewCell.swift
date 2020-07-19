//
//  PriceTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-15.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

weak var pvc = PriceTableViewCell()

class PriceTableViewCell: UITableViewCell {

    @IBOutlet weak var subtotal: UILabel!
    
    @IBOutlet weak var shipping: UILabel!
    
    @IBOutlet weak var estimatedTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pvc = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
