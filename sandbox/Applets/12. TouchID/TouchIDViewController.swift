//
//  TouchIDViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-06.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import LocalAuthentication
import Analytics

class TouchIDViewController: UIViewController {
    
    @IBOutlet weak var success: UIImageView!
    
    @IBOutlet weak var successLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        success.isHidden = true
        successLabel.isHidden = true
    }
    
    @IBAction func touchIDPrompt(_ sender: UIButton) {
        Analytics.shared().track("12: BiometricID Prompted")
        
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        self.runSecretCode()
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "Sorry!", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Biometric ID not available", message: "Your device is not configured for Biometric ID.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    func runSecretCode(){
        print("run secret")
        UIView.transition(with: self.success, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.success.isHidden = false
        }, completion: nil)
        
        UIView.transition(with: self.successLabel, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.successLabel.isHidden = false
        }, completion: nil)
        
    }
    
}
