//
//  TextInputTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-03.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class TextInputTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var textField: UITextField!
    public func configure(#text: String?, placeholder: String) {
        textField.text = text
        textField.placeholder = placeholder

        textField.accessibilityValue = text
        textField.accessibilityLabel = placeholder
    }

}
