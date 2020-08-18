//
//  CreateAccountViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-28.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

protocol accountDelegate {
    func accountInfo(u: String, p: String)
}

class CreateAccountViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    var delegate: accountDelegate!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var checkBox: UIButton!
    
    @IBOutlet weak var agree: UILabel!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var collectionOfLabels:[UILabel]!
    
    @IBOutlet var collectionOfTitleLabels:[UILabel]!
    
    @IBOutlet weak var termsOfService: UIButton!
    
    @IBOutlet weak var link: UIButton!
    
    var errorMsg = UILabel()
    
    var a11y = false

    var termsAgreed = false
    
    var correctA11y = true

    
    // MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        a11y = settings.a11yIsOn
        if (a11y){
            setA11yViolations()
        }
        else{
            setA11yCorrect()
        }
        createButton()
        username.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
    }

    
    // MARK: Functions
    
    // Setting Correct a11y Features
    func setA11yCorrect() {
        link.isHidden = true
        agree.isAccessibilityElement = true
        checkBox.isAccessibilityElement = true
        Button.isAccessibilityElement = true
        agree.accessibilityLabel = "I Agree to the Mesmer Terms of Service and Privacy Policy"
        checkBox.accessibilityLabel = "Checkbox"
        Button.accessibilityLabel = "Create Account"
        print("a11y true")
    }
    
    // Setting a11y Violations
    func setA11yViolations() {
        agree.isAccessibilityElement = true
        checkBox.isAccessibilityElement = true
        Button.isAccessibilityElement = true
        checkBox.accessibilityLabel = "Checkbox"
        agree.accessibilityLabel = "I Agree to the Mesmer Terms of Service and Privacy Policy"
        Button.accessibilityLabel = "Continue"
        collectionOfLabels[0].isHidden = true
        collectionOfLabels[1].isHidden = true
        collectionOfLabels[2].isHidden = true
        //setTermsContrainsts()
        termsOfService.isHidden = true
        link.isHidden = false
        setAgreeContrainsts()
        setCheckboxContrainsts()
        setLinkContrainsts()
        correctA11y = false  // for the error messages
        username.placeholder = "Username"
        password.placeholder = "Password"
        confirmPassword.placeholder = "Confirm Password"
        collectionOfTitleLabels[0].isHidden = true
        collectionOfTitleLabels[1].isHidden = true
        collectionOfTitleLabels[2].isHidden = true

        print("a11y false")
    }

    // Setting agreement statement constraints that violate a11y rules
    func setAgreeContrainsts() {
        agree.translatesAutoresizingMaskIntoConstraints = false
        agree.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        agree.text = "I agree to the Mesmer Terms of Service and Privacy Policy"
        //errorMsg.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 700).isActive = true
        //agree.centerYAnchor.constraint(equalTo: self.Button.bottomAnchor, constant: 50).isActive = true
    }

    func setLinkContrainsts() {
        link.translatesAutoresizingMaskIntoConstraints = false
        link.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 265).isActive = true
    }
    //link.isHidden = true
    // Setting checkbox constraints that violate a11y rules
    func setCheckboxContrainsts() {
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 310).isActive = true
        //checkBox.leadingAnchor.constraint(equalTo: self.agree.trailingAnchor, constant: 15) = true
        //checkBox.leadingAnchor.constraint(equalTo: self.agree.leadingAnchor, constant: 245).isActive = true
    }
    
    // Checkbox tapped action
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
    
    // Create account action
    @IBAction func createAccount(_ sender: UIButton) {
        print("clicked!")
        if (correctA11y){
            if termsAgreed == true {
                if (isValidEmail(input: username.text!) && password.text?.count ?? 0 >= 6 && password.text == confirmPassword.text){
                    performSegue(withIdentifier: "createAccount", sender: self)
                    print("yeet")
                    Analytics.shared().track("1: Account Created", properties: [
                        "username": username.text!,
                        "password": password.text!
                    ])
                    
                }
                else {
                    createErrorMsg()
                    Analytics.shared().track("1: Invalid Info While Creating Account", properties: [
                         "username": username.text!,
                         "password": password.text!
                     ])
                }
            }
            else{
                createErrorMsg()
            }
        }
        else {
            performSegue(withIdentifier: "createAccount", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createAccount" {
            let destinationVC = segue.destination as! LoginViewController
            destinationVC.inputU = username.text
            destinationVC.inputP = password.text
            //destination
        }
    }
    
    @IBAction func viewTerms(_ sender: UIButton) {
        performSegue(withIdentifier: "terms", sender: self)
    }
    
    @IBAction func linkTerms(_ sender: UIButton) {
        performSegue(withIdentifier: "terms", sender: self)
    }
    
    // Creating Buttton
    func createButton(){
        //Button.isHidden = true
        Button.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        Button.layer.cornerRadius = 25.0
        Button.setTitle("Create Account", for: .normal)
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
        //Button.centerYAnchor.constraint(equalTo: self.agree.bottomAnchor, constant: 50).isActive = true
    }
    
    // Creating Error Message if Needed
    func createErrorMsg(){
        //Button.isHidden = true
        //errorMsg.titleLabel? = "Pleae enter a username and password"
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 12.0)
        
        if (!isValidEmail(input: username.text!)){
            errorMsg.text = "Invalid Email"
        }
        else if (password.text?.count ?? 0 < 6)
        {
            errorMsg.text = "Password must be at least 6 characters"
        }
        else if (password.text != confirmPassword.text) {
            errorMsg.text = "Passwords do not match"
        }
        else {
            errorMsg.text = "Please agree to the terms and conditions"
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

