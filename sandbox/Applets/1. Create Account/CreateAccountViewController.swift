//
//  CreateAccountViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-28.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

protocol accountDelegate {
    func accountInfo(u: String, p: String)
}

class CreateAccountViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: accountDelegate!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var checkBox: UIButton!
    
    @IBOutlet weak var agree: UILabel!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var errorMsg = UILabel()
    
    var a11y = false

    var termsAgreed = false


    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        //let vc = LoginViewController()
        //delegate = vc as! accountDelegate
        createButton()
        username.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        a11y = settings.a11yIsOn
        print("a11y in creat account is set to \(a11y)")
        if (a11y){
            setA11y1()
        }
        else{
            setA11y2()
        }

    }

    func setA11y1() {
        agree.isAccessibilityElement = true
        checkBox.isAccessibilityElement = true
        agree.accessibilityLabel = "I Agree to the Mesmer Terms of Service and Privacy Policy"
        checkBox.accessibilityLabel = "Checkbox"
        print("a11y true")
    }
    
    func setA11y2() {
        agree.isAccessibilityElement = true
        checkBox.isAccessibilityElement = true
        checkBox.accessibilityLabel = "Checkbox"
        agree.accessibilityLabel = "I Agree to the Mesmer Terms of Service and Privacy Policy"
        print("a11y false")
    }

    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool{
        textfield.resignFirstResponder()
        return true
    }
    
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
        //Button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 630).isActive = true
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        print("clicked!")
        if (a11y){
            if termsAgreed == true {
                if (username.text != "" && password.text != "" && password.text == confirmPassword.text)
                {
                    performSegue(withIdentifier: "createAccount", sender: self)
                    print("yeet")
                }
                else {
                    createErrorMsg()
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
        let destinationVC = segue.destination as! LoginViewController
        destinationVC.inputU = username.text
        destinationVC.inputP = password.text
        //destination
    }
    
    
    func createErrorMsg(){
        //Button.isHidden = true
        //errorMsg.titleLabel? = "Pleae enter a username and password"
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 12.0)
        
        if (username.text == "" || password.text == "" || confirmPassword.text == "" )
        {
            errorMsg.text = "Please fill in all fields"
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
