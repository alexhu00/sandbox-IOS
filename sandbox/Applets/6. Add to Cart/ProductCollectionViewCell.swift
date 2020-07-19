//
//  ProductCollectionViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-10.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /*
        let redView = UIView(frame: bounds)
        redView.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        self.backgroundView = redView

        let blueView = UIView(frame: bounds)
        blueView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1)
        self.selectedBackgroundView = blueView
 */
    }
}
