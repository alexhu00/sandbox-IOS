//
//  OneTimePasswordViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-05.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class OneTimePasswordViewController: UIViewController {
    
    @IBOutlet weak var checkMark: UIImageView!
    
    @IBOutlet weak var exitAppletButton: UIButton!

    @IBOutlet weak var successLabel: UILabel!
    
    var errorMsg = UILabel()
    
    @IBOutlet weak var codeTextField: OneTimeTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkMark.isHidden = true
        exitAppletButton.isHidden = true
        
        successLabel.isHidden = true

        codeTextField.configure()
        codeTextField.didEnterLastDigit = { [weak self] code in
            
            self!.errorMsg.isHidden = true
            
            UIView.transition(with: self!.checkMark, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self!.checkMark.isHidden = false
            }, completion: nil)
            
            UIView.transition(with: self!.successLabel, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self!.successLabel.isHidden = false
            }, completion: nil)

            UIView.transition(with: self!.exitAppletButton, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self!.exitAppletButton.isHidden = false
            }, completion: nil)
            
            self!.codeTextField.resignFirstResponder()
        }
        codeTextField.failMsg = { [weak self] code in
            self!.createErrorMsg()
        }
    }
    
    // Creating Error Message if Needed
    func createErrorMsg(){
        Analytics.shared().track("11: Incorrect One Time Password Entered")
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 17.0)
        errorMsg.text = "Incorrect"
        errorMsg.textColor = UIColor(ciColor: .red)
        errorMsg.textAlignment = .center
        view.addSubview(errorMsg)
        setErrorMsgContrainsts()
    }
    
    func setErrorMsgContrainsts() {
        Analytics.shared().track("11: Correct One Time Password Entered")
        errorMsg.translatesAutoresizingMaskIntoConstraints = false
        errorMsg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        errorMsg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        errorMsg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //errorMsg.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 700).isActive = true
        errorMsg.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 400).isActive = true
    }
    
    @IBAction func exitApplet(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindBack", sender: self)
        Analytics.shared().track("11: Applet Exited from One Time Password")
    }
    

}
