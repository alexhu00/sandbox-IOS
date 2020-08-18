//
//  CartCheckoutViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-07.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//


import UIKit
import Analytics

class CartCheckoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var buttonView: UIView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath) as! headerTableViewCell
            cell.itemsInCart.text = "1"
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemList", for: indexPath) as! itemTableViewCell
            cell.productImage.image = #imageLiteral(resourceName: "customer-bot (1)")
            cell.productTitle.text = "Customer Bot"
            cell.productQty.text = "1"
            cell.productPrice.text = "$3.00"
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "price", for: indexPath) as! priceTableViewCell
            cell.subtotalPrice.text = "$3.00"
            cell.shipPrice.text = "$9.00"
            cell.estTotalPrIce.text = "$12.00"
            cell.selectionStyle = .none
            return cell
        }
    }
    
    // Rows that can be edited
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        createButton()
    }

    // Creating Buttton
    func createButton(){
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
    
    @IBAction func checkoutSegue(_ sender: UIButton) {
        performSegue(withIdentifier: "checkoutSegue", sender: self)
        Analytics.shared().track("16: Checkout Button Tapped")
    }
    
}
