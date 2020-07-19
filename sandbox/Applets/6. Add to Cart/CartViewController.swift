//
//  CartViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-13.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

weak var vc = CartViewController()

protocol update {
    func update()
}

protocol removingUpdate{
    func removingUpdate()
}

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var headerDelegate: update!
    
    var removingCellDelegate: removingUpdate!

    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var Button: UIButton!
    
    var plusMinusPrice: Double = 0
    
    var totalPrice = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        createButton()
        vc = self
        plusMinusPrice = 0
        totalPrice = 0.00
    }
    
    func calcSubtotal(){
        print("hi")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.productList.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath)
            return cell
        }
        else if indexPath.row >= 1 && indexPath.row <= cartItems.productList.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemList", for: indexPath) as! ItemsListTableViewCell
            cell.itemImage.image = cartItems.productList[indexPath.row - 1].productImage
            cell.itemName.text = cartItems.productList[indexPath.row - 1].productName
            cell.itemPrice.text = cartItems.productList[indexPath.row - 1].productPrice
        
            var singleItemPrice = cartItems.productList[indexPath.row - 1].productPrice
            
            singleItemPrice.remove(at: singleItemPrice.startIndex)
            print(singleItemPrice)
            
            let itemPriceCalcuated = String(format: "%.2f",  Double(singleItemPrice)! * Double(cartItems.productList[indexPath.row - 1].qty))
            cell.itemPrice.text = "$\(itemPriceCalcuated)"
            cell.itemQty.text = (String (cartItems.productList[indexPath.row - 1].qty))
            cell.itemView.layer.cornerRadius = 10
            //cell.accessoryType = plus
            //cell.accessoryType = minus
            
            totalPrice += Double(itemPriceCalcuated)!
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "price", for: indexPath) as! PriceTableViewCell
            
            let preShippingAmt = String(format: "%.2f", Double(totalPrice))
            cell.subtotal.text = "$\(preShippingAmt)"
            
            cell.shipping.text = "$9.00"
            
            let totalAmt = String(format: "%.2f", Double(totalPrice + 9.00))
            
            cell.estimatedTotal.text = "$\(totalAmt)"

            return cell
        }
    }

    // Rows that can be edited
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == 0  {
            return false
        }
        if indexPath.row == cartItems.productList.count + 1{
            return false
        }
        else{
            return true
        }
    }
    
    // Removing Items
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //cartItems.totalCount = cartItems.totalCount - cartItems.productList[indexPath.row - 1].qty
            cartItems.productList.remove(at: indexPath.row - 1)
            cartItems.listofProducts.remove(at: indexPath.row - 1)
            cartItems.findTotalCount()
            
            
            print("plusminus is: \(plusMinusPrice)")
            
            //removingCellDelegate.removingUpdate()
            
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
            /*
            let vc = HeaderCartTableViewCell()
            var num = 0
            for i in cartItems.productList{
                num += i.qty
            }
            vc.itemCount.text = String(num)
            */
            totalPrice = 0.00
            self.table.reloadData()
            //HeaderCartTableViewCell.reloadData
            headerDelegate.update()
        }
    }
    

    // Creating Buttton
    func createButton(){
        //Button.isHidden = true
        Button.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        Button.layer.cornerRadius = 25.0
        Button.setTitle("Checkout", for: .normal)
        Button.setTitleColor(.white, for: .normal)
        Button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20.0)
        buttonView.addSubview(Button)
        setButtonContrainsts()
    }
    
    func setButtonContrainsts() {
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        Button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        Button.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 30).isActive = true
        //Button.centerYAnchor.constraint(equalTo: self.agree.bottomAnchor, constant: 50).isActive = true
    }
    
}
