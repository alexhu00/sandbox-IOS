//
//  AddingScreenViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-02.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

protocol creditCardDelegate{
    func changePayment(cardNum: String)
}

class AddingScreenViewController: UIViewController, UITextFieldDelegate {

    var cardDelegate: creditCardDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //cardholderName.set
        mmyy.delegate = self
        cardNumber.delegate = self
        createButton()
        //cardDelegate = AddPaymentViewController().self

        // Do any additional setup after loading the view.
    }
    
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
    
    func modifyCreditCardString(creditCardString : String) -> String {
        let trimmedString = creditCardString.components(separatedBy: .whitespaces).joined()

        let arrOfCharacters = Array(trimmedString)
        var modifiedCreditCardString = ""

        if(arrOfCharacters.count > 0) {
            for i in 0...arrOfCharacters.count-1 {
                modifiedCreditCardString.append(arrOfCharacters[i])
                if((i+1) % 4 == 0 && i+1 != arrOfCharacters.count){
                    modifiedCreditCardString.append(" ")
                }
            }
        }
        return modifiedCreditCardString
    }
    
    func stringtoInt(input: String){
        self.creditCardNumber = Int(input) ?? 0
        print(creditCardNumber)
    }
    
    @IBAction func cardNum(_ sender: UITextField) {
        stringtoInt(input: sender.text ?? "0")
        print(sender.text)
        //sender.text = self.modifyCreditCardString(creditCardString: sender.text!)
    }
    
    var creditCardNumber: Int = 0
    
    @IBOutlet weak var cardholderName: UITextField!
    
    @IBOutlet weak var cardNumber: UITextField!
    
    @IBOutlet weak var mmyy: UITextField!
    
    @IBOutlet weak var cvv: UITextField!
    
    @IBOutlet weak var saveInfoButton: UIButton!

    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var errorMsg = UILabel()
    
    @IBAction func saveInfo(_ sender: UIButton) {
        var saved2 = 0
        //let vc = storyboard!.instantiateViewController(withIdentifier: "AddPaymentViewController") as! AddPaymentViewController
        //let vc = AddPaymentViewController()
        //performSegue(withIdentifier: "createAccount", sender: self)
        if (cardholderName.text != "" && cardNumber.text != "" && mmyy.text?.count == 5 && cvv.text?.count == 3){
            guard var saved = Int(cardNumber.text ?? "") else {
                createErrorMsg()
                return
            }
            saved2 = saved % 10000
        }
        else {
            createErrorMsg()
            return
        }
        var input = String(saved2)
        cardDelegate?.changePayment(cardNum: input)

        //vc.text = "1234"
        //vc.confirmationLabel.text = "YOLO"
        //vc.changeLabel()

        dismiss(animated: true, completion: nil)
        print("ran dimissal \n")
    }

    
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
    
    func setButtonContrainsts() {
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        Button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //Button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 630).isActive = true
    }
    
    //cardholderName.text != "" && cardNumber.text != "" && mmyy.text?.count == 5 && cvv.text?.count == 3
    
    func createErrorMsg(){
        //Button.isHidden = true
        //errorMsg.titleLabel? = "Pleae enter a username and password"
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 12.0)
    
        if (cardholderName.text == "" || cardNumber.text == "" || mmyy.text == "" || cvv.text == "" )
        {
            errorMsg.text = "Please fill in all fields"
        }
        else if (mmyy.text?.count != 5) {
            errorMsg.text = "Invalid MM/YY"
        }
        else if (cvv.text?.count != 3) {
            errorMsg.text = "Invalid CVV"
        }
        else {
            errorMsg.text = "Please fill in all fields"
        }
        

        errorMsg.textColor = UIColor(ciColor: .red)
        errorMsg.textAlignment = .center
        view.addSubview(errorMsg)
        setErrorMsgContrainsts()
            
    /*
            UIView.transition(with: errorMsg,
                              duration: 5.0,
                                  options: [.transitionCrossDissolve],
                                  animations: {
                                    self.errorMsg.text = "Pleae enter a username and password"
            }, completion: nil)
     */
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
