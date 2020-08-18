//
//  AddingScreenViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-02.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

protocol creditCardDelegate{
    func changePayment(cardNum: String)
}

class AddingScreenViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties

    var cardDelegate: creditCardDelegate?

    var creditCardNumber: Int = 0
    
    @IBOutlet weak var cardholderName: UITextField!
    
    @IBOutlet weak var cardNumber: UITextField!
    
    @IBOutlet weak var mmyy: UITextField!
    
    @IBOutlet weak var cvv: UITextField!
    
    @IBOutlet weak var expiryDateLabel: UILabel!
    
    @IBOutlet weak var saveInfoButton: UIButton!

    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var errorMsg = UILabel()
    
    var m: Int = 20
    
    var a11y = settings.a11yIsOn
    
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mmyy.delegate = self
        cardNumber.delegate = self
        createButton()
        cardholderName.delegate = self
        cardNumber.delegate = self
        mmyy.delegate = self
        cvv.delegate = self
        m = Int(mmyy.text!.prefix(3)) ?? 25

        if (a11y){
            setA11yViolations()
        }
        else{
            setA11yCorrect()
        }
    }
    
    func setA11yCorrect() {
        mmyy.isAccessibilityElement = true
        mmyy.accessibilityLabel = "Enter data in MM/YY format"
        print("a11y true")
    }
    
    func setA11yViolations() {
        mmyy.isAccessibilityElement = true
        mmyy.accessibilityLabel = "Enter data"
        expiryDateLabel.text = "Expiry Date"
        print("a11y false")
    }
    
    // MARK: Functions
    
    // Clicking the save information button
    @IBAction func saveInfo(_ sender: UIButton) {
        var saved2 = 0
        if (cardholderName.text != "" && cardNumber.text != "" && mmyy.text?.count == 5 && cvv.text?.count == 3 && cvv.text!.isInt && cardNumber.text!.isInt && cardNumber.text!.count > 15){
            // && m <= 12)
            guard let saved = Int(cardNumber.text ?? "") else {
                createErrorMsg()
                return
            }
            saved2 = saved % 10000
        }
        else {
            createErrorMsg()
            return
        }
        let input = String(saved2)
        cardDelegate?.changePayment(cardNum: input)
        dismiss(animated: true, completion: nil)
        Analytics.shared().track("4: Payment Added", properties: [
            "cardholderName": cardholderName.text!,
            "cardNumber": cardNumber.text!,
            "mmyy": mmyy.text!,
            "cvv": cvv.text!,
        ])

        print("ran dimissal \n")
    }
    
    // Creating Error Message Depending on the Specific Error
    func createErrorMsg(){
        
        Analytics.shared().track("4: Invalid Payment", properties: [
            "cardholderName": cardholderName.text!,
            "cardNumber": cardNumber.text!,
            "mmyy": mmyy.text!,
            "cvv": cvv.text!,
        ])

        errorMsg.font = UIFont(name: "Roboto-Bold", size: 12.0)
    
        if (cardholderName.text == "" || cardNumber.text == "" || mmyy.text == "" || cvv.text == "" ){
            errorMsg.text = "Please fill in all fields"
        }
        else if (cardNumber.text!.isInt == false || cardNumber.text!.count <= 15) {
            errorMsg.text = "Invalid Card Number"
        }
        else if (mmyy.text?.count != 5) {
            print("this is \(m)")
            errorMsg.text = "Invalid MM/YY"
        }
        else if (cvv.text?.count != 3 || cvv.text!.isInt == false) {
            print("this is \(cvv.text!.isInt)")
            errorMsg.text = "Invalid CVV"
        }
        else {
            errorMsg.text = "Please fill in all fields"
        }
        
        errorMsg.textColor = UIColor(ciColor: .red)
        errorMsg.textAlignment = .center
        view.addSubview(errorMsg)
        setErrorMsgContrainsts()
    }
    
    // Setting Error Message Constraints
    func setErrorMsgContrainsts() {
        errorMsg.translatesAutoresizingMaskIntoConstraints = false
        errorMsg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        errorMsg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        errorMsg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        errorMsg.centerYAnchor.constraint(equalTo: self.Button.bottomAnchor, constant: 50).isActive = true
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

    // Turn inputted string (from Card Number Text Field) to an integer
    func stringtoInt(input: String){
        self.creditCardNumber = Int(input) ?? 0
        print(creditCardNumber)
    }
    
    // Card Number Text Field Action to turn string into integer
    @IBAction func cardNum(_ sender: UITextField) {
        stringtoInt(input: sender.text ?? "0")
    }
    
    // Dismiss modal
    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // Creating the Add Button
    func createButton(){
        //Button.isHidden = true
        Button.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        Button.layer.cornerRadius = 25.0
        Button.setTitle("Add", for: .normal)
        Button.setTitleColor(.white, for: .normal)
        Button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20.0)
        view2.addSubview(Button)
        scrollView.delaysContentTouches = false
        setButtonContrainsts()
    }
    
    // Setting Add Button Contrainsts
    func setButtonContrainsts() {
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        Button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

// Extension to create isInt property of string that sees if it is an intger or not
extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

