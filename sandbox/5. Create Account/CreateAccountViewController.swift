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

class CreateAccountViewController: UIViewController {
    
    var delegate: accountDelegate!
    //var Button = UIButton()
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var Button: UIButton!
    
    var errorMsg = UILabel()
    

    var termsAgreed = false

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = LoginViewController()
        delegate = vc as! accountDelegate
        createButton()
        
        // Do any additional setup after loading the view.
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
        view.addSubview(Button)
        setButtonContrainsts()
    }
    
    func setButtonContrainsts() {
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        Button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        Button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 620).isActive = true
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        if termsAgreed == true {
            if username.text == "alexhu" && password.text == "alexhu"{
                //let vc = LoginViewController()
                //vc.inputP = password.text
                //vc.inputU = "ALEX HU"
                performSegue(withIdentifier: "createAccount", sender: self)
                print("yay")
                delegate.accountInfo(u: username.text! , p: password.text!)
            }
            //print(username.text!)
            // print(password.text!)
        }
        else{
            createErrorMsg()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! LoginViewController
        destinationVC.inputU = "ALEX HU"
    }
    
    
    func createErrorMsg(){
        //Button.isHidden = true
        //errorMsg.titleLabel? = "Pleae enter a username and password"
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 12.0)
        errorMsg.text = "Pleae enter a username and password"
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
        errorMsg.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 680).isActive = true
    }
    
    

}
