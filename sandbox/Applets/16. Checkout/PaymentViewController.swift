//
//  PaymentViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-08.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class PaymentViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var cardNumber: UITextField!
    
    @IBOutlet weak var mmyy: UITextField!
    
    @IBOutlet weak var cvv: UITextField!
    
    @IBOutlet weak var View2: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var errorMsg = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        name.delegate = self
        cardNumber.delegate = self
        cardNumber.keyboardType = .numberPad
        mmyy.delegate = self
        mmyy.keyboardType = .numberPad
        cvv.delegate = self
        cvv.keyboardType = .numberPad
    }
    
    // Allowing User to Dismiss Keyboard
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool{
        textfield.resignFirstResponder()
        return true
    }
    
    // Applying character limits to text fields and inputting in "/" in mm/yy format
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField == mmyy){
            if string == "" {
                return true
            }

            let currentText = textField.text! as NSString
            let updatedText = currentText.replacingCharacters(in: range, with: string)

            textField.text = updatedText
            let numberOfCharacters = updatedText.count
            if numberOfCharacters == 2 {
                textField.text?.append("/")
            }
            return false
        }
        if (textField == cardNumber){
            guard let textFieldText = textField.text,
                let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                    return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 19
        }
        if (textField == cvv){
            guard let textFieldText = textField.text,
                let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                    return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 3
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
        //Button.topAnchor.constraint(equalTo: self.cvv.bottomAnchor, constant: 30).isActive = true
    }
    
    // Continue Button That Checks if Info is Valid
    @IBAction func continueSegue(_ sender: UIButton) {
        if name.text?.count != 0 && cardNumber.text!.count >= 16 && mmyy.text?.count == 5 && cvv.text?.count == 3 {
            
            Analytics.shared().track("16: Valid Payment Information Entered")
            performSegue(withIdentifier: "segueBilling", sender: self)
            CheckoutInfo.cardholderName = name.text!
            CheckoutInfo.cardNumber = cardNumber.text!
            CheckoutInfo.monthYear = mmyy.text!
            CheckoutInfo.cvvNum = cvv.text!
        }
        else{
            Analytics.shared().track("16: Invalid Payment Information Entered")
            createErrorMsg()
        }
    }
    
    // Creating Error Message if Needed
    func createErrorMsg(){
        //Button.isHidden = true
        //errorMsg.titleLabel? = "Pleae enter a username and password"
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 17.0)

        if (cardNumber.text!.count < 16){
            errorMsg.text = "Invalid Card Number"
        }
        else if (mmyy.text?.count != 5) {
            errorMsg.text = "Invalid MM/YY"
        }
        else if (cvv.text?.count != 3){
            errorMsg.text = "Invalid CVV"
        }
        else{
            errorMsg.text = "Please Fill in All Fields"
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
    
}
