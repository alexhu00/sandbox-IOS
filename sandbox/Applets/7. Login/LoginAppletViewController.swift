//
//  LoginAppletViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-16.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class LoginAppletViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!

    var errorMsg = UILabel()
    
    var hardcodeUsername: String = "MesmerBot"
    
    var hardcodePassword: String? = "Mesmer123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        username.delegate = self
        password.delegate = self
    }
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool{
        textfield.resignFirstResponder()
        return true
    }

    @IBAction func loginPress(_ sender: UIButton) {
        if (username.text == hardcodeUsername && password.text == hardcodePassword){
            performSegue(withIdentifier: "successfulLogin", sender: self)
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
