//
//  HeaderCartTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-13.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

weak var hvc = HeaderCartTableViewCell()

class HeaderCartTableViewCell: UITableViewCell, update, update2 {
    // Defining delegate method for when item qty is changed via button pressing in the ItemListTableViewCell
    func update2() {
        UIView.transition(with: self.itemCount, duration: 0.5, options: .transitionCrossDissolve, animations: {
            
            cartItems.findTotalCount()
            self.itemCount.text = String(cartItems.totalCount)
            
        }, completion: nil)
    }
    
    // Defining delegate method for when entire item is removed via swiping in the CartViewController
    func update() {
        UIView.transition(with: self.itemCount, duration: 0.5, options: .transitionCrossDissolve, animations: {
            
            cartItems.findTotalCount()
            self.itemCount.text = String(cartItems.totalCount)
            
        }, completion: nil)
  
    }
    

    @IBOutlet weak var itemCount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cartItems.findTotalCount()
        itemCount.text = String(cartItems.totalCount)
        
        // Setting headerDelegate as self
        //NOTE: Since "viewDidLoad" happens before "awakeFromNib" we reference vc!.headerDelegate = self here
        vc!.headerDelegate = self
        
        // Setting hvc as self so that HeaderCartTableViewCell can be accessed elsewhere
        hvc = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
