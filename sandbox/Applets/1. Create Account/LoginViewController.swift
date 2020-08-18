//
//  LoginViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-28.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    var inputP: String?
    
    var inputU: String?
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    var errorMsg = UILabel()
    

    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let vc = CreateAccountViewController()
        //vc.delegate = self
        createButton()
    }
    

    // MARK: Functions
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool{
        textfield.resignFirstResponder()
        return true
    }

    @IBAction func loginClicked(_ sender: UIButton) {
        print("woohoo")
        if (username.text == inputU && password.text == inputP){
            performSegue(withIdentifier: "successScreen", sender: self)
            Analytics.shared().track("1: Login Successful", properties: [
                "username": username.text!,
                "password": password.text!
            ])
        }
        else{
            createErrorMsg()
        }
    }
    
    func createButton(){
        //Button.isHidden = true
        button.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        button.layer.cornerRadius = 25.0
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20.0)
        view.addSubview(button)
        setButtonContrainsts()
        username.delegate = self
        password.delegate = self
    }
    
    func setButtonContrainsts() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
    }
    
    func createErrorMsg(){
        //Button.isHidden = true
        //erorMsg.titleLabel? = "Pleae enter a username and password"
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 12.0)
        errorMsg.text = "Incorrect username or password"
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
        errorMsg.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 520).isActive = true
    }
}

