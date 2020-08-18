//
//  TestQuestionViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-04.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class TestQuestionViewController: UIViewController, UITextFieldDelegate {

    var q: String?
    var a: String?
    
    @IBOutlet weak var question: UITextField!
    
    @IBOutlet weak var answer: UITextField!
    
    @IBOutlet weak var checkMark: UIImageView!

    @IBOutlet weak var successLabel: UILabel!
    
    @IBOutlet weak var exitAppletButton: UIButton!
    
    var errorMsg = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question.delegate = self
        answer.delegate = self
        question.text = q
        checkMark.isHidden = true
        successLabel.isHidden = true
        exitAppletButton.isHidden = true
    }
    
    @IBAction func submit(_ sender: UIBarButtonItem){
        if answer.text == a{
            Analytics.shared().track("11: Correct Test Answer Submitted")
            errorMsg.isHidden = true
            UIView.transition(with: self.checkMark, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self.checkMark.isHidden = false
            }, completion: nil)
            
            UIView.transition(with: self.successLabel, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self.successLabel.isHidden = false
            }, completion: nil)

            UIView.transition(with: self.exitAppletButton, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.exitAppletButton.isHidden = false
            }, completion: nil)
        }
        else{
            Analytics.shared().track("11: Incorrect Test Answer Submitted")
            createErrorMsg()
        }
    }
    
    @IBAction func exitApplet(_ sender: UIButton) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
    // Creating Error Message if Needed
    func createErrorMsg(){
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 17.0)
        errorMsg.text = "Incorrect Answer"
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
        errorMsg.centerYAnchor.constraint(equalTo: self.answer.bottomAnchor, constant: 100).isActive = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == question{
            return false
        }
        else{
            return true
        }
    }
    
    
}
