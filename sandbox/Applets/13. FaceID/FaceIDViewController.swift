//
//  FaceIDViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-06.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import LocalAuthentication

class FaceIDViewController: UIViewController {

    
    @IBOutlet weak var success: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        success.isHidden = true
    }
    
    
    @IBAction func faceIDPrompt(_ sender: UIButton) {
        let context:LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Message") { (good, error) in
                if good{
                    self.runSecretCode()
                }
                else{
                    print("FAILED")
                }
            }
        }
    }
    
    func runSecretCode(){
        print("run secret")
        UIView.transition(with: self.success, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.success.isHidden = false
        }, completion: nil)
    }
    
}
