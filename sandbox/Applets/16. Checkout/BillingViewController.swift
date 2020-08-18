//
//  BillingViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-08.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class BillingViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var address1: UITextField!
    
    @IBOutlet weak var address2: UITextField!
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var state: UITextField!
    
    @IBOutlet weak var zipCode: UITextField!
    
    @IBOutlet weak var View2: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var errorMsg = UILabel()
    
    var sameAsShipping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstName.delegate = self
        lastName.delegate = self
        address1.delegate = self
        address2.delegate = self
        city.delegate = self
        state.delegate = self
        zipCode.delegate = self
        zipCode.keyboardType = .numberPad
        createButton()
    }
    
    // Allow user to dimiss keyboard by clicking return
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool{
        textfield.resignFirstResponder()
        return true
    }
    
    // Applying character limits to text fields and inputting in "/" in mm/yy format
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField == state){
            guard let textFieldText = textField.text,
                let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                    return false
            }
            
            let currentText = textField.text!
            let newString = currentText.uppercased()
            textField.text = newString
            
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 2
        }
        else if (textField == zipCode){
            guard let textFieldText = textField.text,
                let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                    return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 5
        }
        return true
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
        //Button.topAnchor.constraint(equalTo: self.zipCode.bottomAnchor, constant: 30).isActive = true
    }
    
    @IBAction func segueConfirm(_ sender: UIButton) {
        if (firstName.text?.count != 0 && lastName.text?.count != 0 && address1.text?.count != 0 && city.text?.count != 0 && state.text?.count == 2 && zipCode.text?.count == 5){
            
            Analytics.shared().track("16: Valid Billing Information Entered")
            performSegue(withIdentifier: "segueConfirm", sender: self)
            CheckoutInfo.billFirstName = firstName.text!
            CheckoutInfo.billLastName = lastName.text!
            CheckoutInfo.billAddress1 = address1.text!
            CheckoutInfo.billAddress2 = address2.text!
            CheckoutInfo.billCity = city.text!
            CheckoutInfo.billState = state.text!
            CheckoutInfo.billZipCode = zipCode.text!
        }
        else {
            Analytics.shared().track("16: Invalid Billing Information Entered")
            createErrorMsg()
        }
    }
    
    // Creating Error Message if Needed
    func createErrorMsg(){
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 17.0)
        if firstName.text?.count == 0 || lastName.text?.count == 0 || address1.text?.count == 0 || city.text?.count == 0 {
            errorMsg.text = "Please Fill in All Fields"
        }

        if (state.text?.count != 2){
            errorMsg.text = "Invalid State"
        }
        // if (zipCode.text?.count != 5)
        else {
            errorMsg.text = "Invalid Zip Code"
        }
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
        //errorMsg.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 700).isActive = true
        errorMsg.centerYAnchor.constraint(equalTo: self.Button.bottomAnchor, constant: 50).isActive = true
    }
    
    // Checkbox tapped action
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            sameAsShipping  = false
            // Set all entries as empty
            firstName.text = ""
            lastName.text = ""
            address1.text = ""
            address2.text = ""
            city.text = ""
            state.text = ""
            zipCode.text = ""
        }
        else{
            sender.isSelected = true
            sameAsShipping  = true
            // Set all entries as equal to shipping info
            firstName.text = CheckoutInfo.shipFirstName
            lastName.text = CheckoutInfo.shipLastName
            address1.text = CheckoutInfo.shipAddress1
            address2.text = CheckoutInfo.shipAddress2
            city.text = CheckoutInfo.shipCity
            state.text = CheckoutInfo.shipState
            zipCode.text = CheckoutInfo.shipZipCode
        }
    }
}
