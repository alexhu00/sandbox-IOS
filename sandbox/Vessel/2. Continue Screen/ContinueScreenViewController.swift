//
//  ContinueScreenViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-22.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class ContinueScreenViewController: UIViewController {
    
    // MARK: Properties
    
    var termsAgreed = false
    
    @IBOutlet weak var Button: UIButton!
    
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }

    // MARK: Functions
    
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
    
    @IBAction func continueToVessel(_ sender: UIButton) {
        if termsAgreed == true {
            performSegue(withIdentifier: "continueToVessel", sender: self)
        }
    }

    // MARK: Creating Button
    func createButton(){
        //Button.isHidden = true
        Button.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        Button.layer.cornerRadius = 25.0
        Button.setTitle("Continue", for: .normal)
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
        //Button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 580).isActive = true
    }

}


/*
 var termsLabel = UILabel()
 
 func createLabel(){
     termsLabel.text = "I agree to the Mesmer Terms of Service and Privacy Policy"
     //termsLabel.font = UIFont(name: "Roboto", size: 8)
     termsLabel.font = UIFont(name: "Roboto-Regular" , size: 15.0)
     view.addSubview(termsLabel)
     setLabelContrainsts()
 }
 
 func setLabelContrainsts() {
     termsLabel.translatesAutoresizingMaskIntoConstraints = false
     termsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
     termsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
     termsLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
     termsLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
 }
 
 
 
 
   func showButton(Button:UIView){

       UIView.animate(withDuration: 2.5, delay: 1.0, options: .curveEaseOut, animations: {
           Button.alpha = 1.0
           Button.isHidden = false
       })
     
       /*
       UIView.animate(withDuration: 1.5, animations:{
           self.Button.backgroundColor = UIColor.init(displayP3Red: 0.467, green: 0.792, blue: 0.596, alpha: 1.0)
       })
 */
       print("shown")

   }
*/

/*
 

 @IBAction func continuebRO(_ sender: UIButton) {
     if termsAgreed == true {
         performSegue(withIdentifier: "continueToVessel", sender: self)
     }
     
 }
 
 
@IBAction func continueToHome(_ sender: UIButton) {
    if termsAgreed == true {
        performSegue(withIdentifier: "continueToHome", sender: self)
    }
    else{
        print("sorry")
    }
}
*/
