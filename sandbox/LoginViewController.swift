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
        createUsername()
    }
    
    var inputP: String?
    var inputU: String?
    
    var username = UILabel()
    
    @IBOutlet weak var pword: UILabel!
    
    
    func createUsername(){
        //Button.isHidden = true
        //errorMsg.titleLabel? = "Pleae enter a username and password"
        username.font = UIFont(name: "Roboto-Bold", size: 20.0)
        username.text = inputU
        username.textAlignment = .center
        username.textColor = UIColor(ciColor: .red)
        view.addSubview(username)
        setErrorMsgContrainsts()
    }
    
        
    func setErrorMsgContrainsts() {
        username.translatesAutoresizingMaskIntoConstraints = false
        username.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        username.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        username.heightAnchor.constraint(equalToConstant: 50).isActive = true
        username.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 680).isActive = true
    }
/*
    func accountInfo(u: String, p: String) {
        print(u)
        print(p)
        username.text = u
        password.text = p
    }
 */
}
 
extension LoginViewController: accountDelegate {
    func accountInfo(u: String, p: String) {
        print("delegate ran!")
        //pword.text = p
        //delegateInput = u
        //password.text = p
    }
    
}

