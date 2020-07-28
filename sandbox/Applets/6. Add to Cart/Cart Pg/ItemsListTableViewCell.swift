//
//  ItemsListTableViewCell.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-13.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

protocol update2 {
    func update2()
}

weak var tvc = ItemsListTableViewCell()

class ItemsListTableViewCell: UITableViewCell {
    
    var headerDelegate2 : update2!
    
    @IBOutlet weak var itemView: UIView!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!

    @IBOutlet weak var itemQty: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var qtyLabel: UILabel!
    
    @IBOutlet weak var seperator: UIView!

    @IBAction func add(_ sender: UIButton) {
        
        // Get IndexPath of the cell that button was pressed in
        let buttonPosition = sender.convert(CGPoint(), to:vc!.table)
        let indexPath = vc!.table.indexPathForRow(at:buttonPosition)
        print( "This is the indexPath: \(indexPath!.row)")
        
        // Update quantity in cell
        
        UIView.transition(with: self.itemQty, duration: 0.5, options: .transitionCurlUp, animations: {
            
            cartItems.productList[indexPath!.row - 1].qty += 1
            cartItems.productQty[indexPath!.row - 1] += 1
            self.itemQty.text = String(cartItems.productList[indexPath!.row - 1].qty)
            
        }, completion: nil)

        // Update price in cell
        
        UIView.transition(with: self.itemPrice, duration: 0.5, options: .transitionCrossDissolve, animations: {
            
            var singleItemPrice = cartItems.productList[indexPath!.row - 1].productPrice
             singleItemPrice.remove(at: singleItemPrice.startIndex)
            let itemPriceCalcuated = String(format: "%.2f",  Double(singleItemPrice)! * Double(cartItems.productList[indexPath!.row - 1].qty))
            self.itemPrice.text = "$\(itemPriceCalcuated)"
            vc!.plusMinusPrice = Double(singleItemPrice)!
            
        }, completion: nil)
        

        print("plusminus: \(vc!.plusMinusPrice)")
        
        // Update quantity in header (with delegate)
        tvc = self
        headerDelegate2.update2()
        
        // Update totals in footer
        updateTotalsFooter()
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        
        // Get IndexPath of the cell that button was pressed in
        let buttonPosition = sender.convert(CGPoint(), to:vc!.table)
        let indexPath = vc!.table.indexPathForRow(at:buttonPosition)
        print( "This is the indexPath: \(indexPath!.row)")
        
        
        // Update Quantity in Cell
        UIView.transition(with: self.itemQty, duration: 0.5, options: .transitionCurlDown, animations: {
            
            let itemQuantity = cartItems.productList[indexPath!.row - 1].qty
            if itemQuantity > 0 {
                cartItems.productList[indexPath!.row - 1].qty -= 1
                cartItems.productQty[indexPath!.row - 1] -= 1
                self.itemQty.text = String(cartItems.productList[indexPath!.row - 1].qty)
            }
            
        }, completion: nil)
        

        // Update Price in Cell
        if (cartItems.productList[indexPath!.row - 1].qty > 0){
            //print("This is ROW: \(indexPath?.row)")
            
            UIView.transition(with: self.itemPrice, duration: 0.5, options: .transitionCrossDissolve, animations: {
                   var singleItemPrice = cartItems.productList[indexPath!.row - 1].productPrice
                      
                   singleItemPrice.remove(at: singleItemPrice.startIndex)
                      
                   let itemPriceCalcuated = String(format: "%.2f", Double(singleItemPrice)! * Double(cartItems.productList[indexPath!.row - 1].qty))
                   self.itemPrice.text = "$\(itemPriceCalcuated)"
                    vc!.plusMinusPrice = -(Double(singleItemPrice)!)
                
            }, completion: nil)
            

            print("plusminus: \(vc!.plusMinusPrice)")
            updateTotalsFooter()
        }
        
        // Removing Cell Case (Qty = 0)
        if cartItems.productList[indexPath!.row - 1].qty == 0 {
            // Apply plus minus calculation
            print("indexoutofRange: \(indexPath!.row - 1)")
            var singleItemPrice = cartItems.productList[indexPath!.row - 1].productPrice
            singleItemPrice.remove(at: singleItemPrice.startIndex)
            vc!.plusMinusPrice = -(Double(singleItemPrice)!)
            
            print("plusminus: \(vc!.plusMinusPrice)")
            
            // Remove row from table
            cartItems.productList.remove(at: indexPath!.row - 1)
            cartItems.listofProducts.remove(at: indexPath!.row - 1)
            cartItems.productQty.remove(at: indexPath!.row - 1)
            cartItems.productPrice.remove(at: indexPath!.row - 1)
            cartItems.findTotalCount()
            vc!.table.beginUpdates()
            vc!.table.deleteRows(at: [indexPath!], with: .automatic)
            vc!.table.endUpdates()
            updateTotalsFooter()
        }
        cartItems.findTotalCount()
        
        // Update header
        headerDelegate2.update2()
        
        // Update totals in footer
        
    
    }
    
    
    func updateTotalsFooter(){
        // Remove $ sign
        var ogSubtotal = pvc!.subtotal.text!
        ogSubtotal.remove(at: ogSubtotal.startIndex)
        // Convert String to Double
        let ogSubtotalNum = Double(ogSubtotal)
    
        
        // Update subtotal
        let newSubtotal = ogSubtotalNum! + vc!.plusMinusPrice

        UIView.transition(with: pvc!.subtotal, duration: 0.5, options: .transitionCrossDissolve, animations: {
            
            let newSubtotalFormatted = String(format: "%.2f", newSubtotal)
            pvc!.subtotal.text = "$\(newSubtotalFormatted)"
            
        }, completion: nil)

            
        // Update estimated total
        UIView.transition(with: pvc!.estimatedTotal, duration: 0.5, options: .transitionCrossDissolve, animations: {
            
            let newEstimatedTotal = newSubtotal + 9.00
            let newEstimatedTotalFormatted = String(format: "%.2f", newEstimatedTotal)
            pvc!.estimatedTotal.text = "$\(newEstimatedTotalFormatted)"
            
        }, completion: nil)
        
        
        //UIView.tranistionwi

    }
    
    

    

    @IBOutlet weak var plus: UIButton!
    
    @IBOutlet weak var minus: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Setting delegate as the header cell here since the itemListTableView cells are initialized AFTER the header tableview cell
        tvc = self
        headerDelegate2 = hvc.self
        //vc!.removingCellDelegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}



/*
 
 func removingUpdate() {
     
     var price = self.itemPrice.text!
     price.remove(at: price.startIndex)
     let priceNum = Double(price)
     vc!.plusMinusPrice = -(priceNum!)
     print("plusminus == \(vc!.plusMinusPrice)")
     updateTotalsFooter()
 }
 
 
 
 
 
 
 //cartItems.totalCount
 //cartItems.findTotalCount()
 
 //self.itemQty.text = String(Int(itemQty.text) + 1)
 /*
  var a = 0
  for i in cartItems.productList{
      a += i.qty
  }
  */
 
 //let indexPath = IndexPath(row: sender.tag, section: 0)
 //cartItems.productList[sender.tag].qty += 1
 //self.qtyLabel += 1
 //CartViewController().table.cellForRow(at: indexPath)
 
 //CartViewController().table.reloadRows(at: [indexPath], with: .none)
 //table[sender.tag].
 //headerDelegate2.d
 */
