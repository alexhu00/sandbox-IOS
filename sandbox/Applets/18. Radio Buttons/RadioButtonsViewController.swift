//
//  RadioButtonsViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-09.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class RadioButtonsViewController: UIViewController {

    @IBOutlet weak var debitCard: UIButton!
    
    @IBOutlet weak var creditCard: UIButton!
    
    @IBOutlet weak var payPal: UIButton!
    
    @IBOutlet weak var Button: UIButton!
    
    var errorMsg = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }
    
    @IBAction func isDebitCard(_ sender: UIButton) {
        Analytics.shared().track("18: Option 1 Selected")
        if debitCard.isSelected == true{
            debitCard.isSelected = false
        }
        else {
            debitCard.isSelected = true
            creditCard.isSelected = false
            payPal.isSelected = false
        }
    }
    
    @IBAction func isCreditCard(_ sender: UIButton) {
        Analytics.shared().track("18: Option 2 Selected")
        if creditCard.isSelected == true{
            creditCard.isSelected = false
        }
        else {
            creditCard.isSelected = true
            debitCard.isSelected = false
            payPal.isSelected = false
        }
    }
    
    @IBAction func isPaypal(_ sender: UIButton) {
        Analytics.shared().track("18: Option 3 Selected")
        if payPal.isSelected == true {
            payPal.isSelected = false
        }
        else{
            payPal.isSelected = true
            debitCard.isSelected = false
            creditCard.isSelected = false
        }
    }
    
    @IBAction func submit(_ sender: UIButton) {
        if (payPal.isSelected == true || debitCard.isSelected == true || creditCard.isSelected == true){
            performSegue(withIdentifier: "submitted", sender: self)
        }
        else{
            createErrorMsg()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "submitted" {
            let destinationVC = segue.destination as! SelectedViewController
            
            if payPal.isSelected == true {
                destinationVC.input = "Paypal Selected"
            }
            else if debitCard.isSelected == true {
                destinationVC.input = "Debit Card Selected"
            }
            else {
                destinationVC.input = "Credit Card Selected"
            }
        }
    }
    
    // Creating Buttton
    func createButton(){
        Button.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        Button.layer.cornerRadius = 25.0
        Button.setTitle("Submit", for: .normal)
        Button.setTitleColor(.white, for: .normal)
        Button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20.0)
        view.addSubview(Button)
        setButtonContrainsts()
    }
    
    func setButtonContrainsts() {
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        Button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // Creating Error Message if Needed
    func createErrorMsg(){
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 12.0)
        errorMsg.text = "Please Choose an Option"
        errorMsg.textColor = UIColor(ciColor: .red)
        errorMsg.textAlignment = .center
        view.addSubview(errorMsg)
        setErrorMsgContrainsts()
    }
    
    func setErrorMsgContrainsts() {
        errorMsg.translatesAutoresizingMaskIntoConstraints = false
        errorMsg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        errorMsg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        errorMsg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        errorMsg.centerYAnchor.constraint(equalTo: self.Button.bottomAnchor, constant: 50).isActive = true
    }
    
    
    
}
