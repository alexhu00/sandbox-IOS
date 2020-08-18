//
//  questionTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-03.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class questionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var questionNumber: UILabel!
    
    @IBOutlet weak var questionText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
