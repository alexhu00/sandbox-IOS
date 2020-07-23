//
//  editInfoViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-21.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

protocol actSettingDelegate {
    func updateInfo()
}

class editInfoViewController: UIViewController {

    var delegate: actSettingDelegate?
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    var errorMsg = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func save(_ sender: UIButton) {
        
        if(!isValidEmail(input: email.text!) || phoneNumber.text!.count != 10 || name.text!.count == 0){
            createErrorMsg()
        }
        else{
            dismiss(animated: true, completion: nil)
            delegate?.updateInfo()
        }
    }
    
    // Validate email
    func isValidEmail(input:String) -> Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: input)
    }
    
    // Creating Error Message if Needed
    func createErrorMsg(){
        //Button.isHidden = true
        //errorMsg.titleLabel? = "Pleae enter a username and password"
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 12.0)
        
        if (!isValidEmail(input: email.text!)){
            errorMsg.text = "Invalid Email"
        }
        else if (phoneNumber.text!.count != 10) {
            errorMsg.text = "Invalid Phone Number"
        }
        else{
            errorMsg.text = "Please fill in name"
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
        errorMsg.centerYAnchor.constraint(equalTo: self.email.bottomAnchor, constant: 50).isActive = true
    }
}
