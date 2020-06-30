//
//  LoginViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-28.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //let vc = CreateAccountViewController()
        //vc.delegate = self
        createButton()
    }
    
    var inputP: String?
    var inputU: String?
    

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var errorMsg = UILabel()
    
    
    @IBOutlet weak var button: UIButton!
    
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
        button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
    }

    /*
    @objc func buttonClicked(sender: UIButton){
        print("yay")
    }
     */
    
    @IBAction func loginClicked(_ sender: UIButton) {
        print("woohoo")
        if (username.text == inputU && password.text == inputP)
        {
            performSegue(withIdentifier: "successScreen", sender: self)
        }
        else
        {
            createErrorMsg()
        }
    }
    
        func createErrorMsg(){
            //Button.isHidden = true
            //errorMsg.titleLabel? = "Pleae enter a username and password"
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

    
    /*
     print("failed")
     print(username.text)
     print(inputU)
     print(password.text)
     print(inputP)
     
     
     
    func accountInfo(u: String, p: String) {
        print(u)
        print(p)
        username.text = u
        password.text = p
    }
 */
}

/*
extension LoginViewController: accountDelegate {
    func accountInfo(u: String, p: String) {
        print("delegate ran!")
        //pword.text = p
        //delegateInput = u
        //password.text = p
    }
    
}

*/
