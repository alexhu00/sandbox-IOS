//
//  PersonalInfoViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-08.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class PersonalInfoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var phoneNum: UITextField!
    
    var errorMsg = UILabel()
    
    @IBOutlet weak var View2: UIView!

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        email.delegate = self
        phoneNum.delegate = self
    }

    // Allow user to dimiss keyboard by clicking return
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool{
        textfield.resignFirstResponder()
        return true
    }
    
    // Validate email
    func isValidEmail(input:String) -> Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: input)
    }
    
    // Liminting Max Character Count
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField == phoneNum){
            guard let textFieldText = textField.text,
                let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                    return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 10
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
        Button.topAnchor.constraint(equalTo: self.phoneNum.bottomAnchor, constant: 30).isActive = true
    }
    
    @IBAction func continueSegue(_ sender: UIButton) {
        if isValidEmail(input: email.text!) && phoneNum.text?.count == 10 {
            performSegue(withIdentifier: "segueToShipping", sender: self)
            
            // Storing info in external Checkout Struct
            CheckoutInfo.email = email.text!
            CheckoutInfo.phoneNumber = phoneNum.text!
            Analytics.shared().track("16: Valid Personal Information Entered")
        }
        else{
            Analytics.shared().track("16: Invalid Personal Information Entered")
            createErrorMsg()
        }
    }
    
    // Creating Error Message if Needed
    func createErrorMsg(){
        //Button.isHidden = true
        //errorMsg.titleLabel? = "Pleae enter a username and password"
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 17.0)
        
        if (!isValidEmail(input: email.text!)){
            errorMsg.text = "Invalid Email"
        }
        else {
            errorMsg.text = "Invalid Phone Number"
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


/*
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

 // Turn inputted string (from Card Number Text Field) to an integer
 func stringtoInt(input: String){
     self.creditCardNumber = Int(input) ?? 0
     print(creditCardNumber)
 }
 
 // Card Number Text Field Action to turn string into integer
 @IBAction func cardNum(_ sender: UITextField) {
     stringtoInt(input: sender.text ?? "0")
     //print(sender.text)
     //sender.text = self.modifyCreditCardString(creditCardString: sender.text!)
 }
 
 
 */
