//
//  ConfirmationViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-08.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var Button: UIButton!
    
    // Personal
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    
    // Shipping
    
    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var cityStateZip: UILabel!
    
    // Payment
    
    @IBOutlet weak var cardNumEnd: UILabel!
    
    // Billing
    
    @IBOutlet weak var billFullName: UILabel!
    
    @IBOutlet weak var billAddress: UILabel!
    
    @IBOutlet weak var billCityStateZip: UILabel!
    
    @IBOutlet weak var View2: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        
        // Personal Info
        self.email.text = CheckoutInfo.email
        self.phone.text = CheckoutInfo.phoneNumber
        
        // Shipping Info
        self.fullName.text = "\(CheckoutInfo.shipFirstName)" + " " + "\(CheckoutInfo.shipLastName)"
        self.address.text = CheckoutInfo.shipAddress1
        self.cityStateZip.text = "\(CheckoutInfo.shipCity)" + ", " + "\(CheckoutInfo.shipState)" + " " + "\(CheckoutInfo.shipZipCode)"
        
        // Payment Info
        let saved = Int(CheckoutInfo.cardNumber)
        let last4 = String(saved! % 10000)
        self.cardNumEnd.text = last4
       
        // Billing Info
        self.billFullName.text = "\(CheckoutInfo.billFirstName)" + " " + "\(CheckoutInfo.billLastName)"
        self.billAddress.text = CheckoutInfo.billAddress1
        self.billCityStateZip.text = "\(CheckoutInfo.billCity)" + ", " + "\(CheckoutInfo.billState)" + " " + "\(CheckoutInfo.billZipCode)"
    }
    
    // Creating Buttton
    func createButton(){
        //Button.isHidden = true
        Button.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        Button.layer.cornerRadius = 25.0
        Button.setTitle("Continue", for: .normal)
        Button.setTitleColor(.white, for: .normal)
        Button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20.0)
        View2.addSubview(Button)
        scrollView.delaysContentTouches = false
        setButtonContrainsts()
    }
    
    func setButtonContrainsts() {
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        Button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @IBAction func segueToFinish(_ sender: UIButton) {
        Analytics.shared().track("16: Item Order Complete")
        performSegue(withIdentifier: "segueFinish", sender: self)
    }
}
