//
//  priceTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-08.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class priceTableViewCell: UITableViewCell {

    
    @IBOutlet weak var subtotalPrice: UILabel!
    
    @IBOutlet weak var shipPrice: UILabel!
    
    @IBOutlet weak var estTotalPrIce: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
