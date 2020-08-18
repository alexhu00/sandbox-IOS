//
//  ContinueScreenViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-22.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class ContinueScreenViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    var termsAgreed = false
    
    @IBOutlet weak var Button: UIButton!

    @IBOutlet weak var email: UITextField!
    
    var errorMsg = UILabel()
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        email.delegate = self
        Analytics.shared().screen("Initial Login")
    }

    // MARK: Functions
    
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
    
    
    @IBAction func continueToVessel(_ sender: UIButton) {
        if isValidEmail(input: email.text!) {
            // Add your own unique ID here or we will automatically assign an anonymousID
            Analytics.shared().identify("User", traits: [
                "email": email.text!
            ])
            performSegue(withIdentifier: "continueToVessel", sender: self)
        }
        else{
            createErrorMsg()
        }
    }

    // MARK: Creating Button
    func createButton(){
        //Button.isHidden = true
        Button.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        Button.layer.cornerRadius = 25.0
        Button.setTitle("Continue", for: .normal)
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
        //Button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 580).isActive = true
    }
    
    
    // Creating Error Message if Needed
    func createErrorMsg(){
        //Button.isHidden = true
        //errorMsg.titleLabel? = "Pleae enter a username and password"
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 17.0)
        errorMsg.text = "Invalid Email"
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
 @IBAction func checkBoxTapped(_ sender: UIButton) {
     if sender.isSelected{
         sender.isSelected = false
         termsAgreed = false
     }
     else{
         sender.isSelected = true
         termsAgreed = true
     }
 }
 */
