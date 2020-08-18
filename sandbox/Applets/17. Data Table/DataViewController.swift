//
//  DataViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-11.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class DataViewController: UIViewController {

    @IBOutlet weak var Cookies: UIButton!
    
    @IBOutlet weak var ApplePie: UIButton!
    
    @IBOutlet weak var PecanPie: UIButton!
    
    @IBOutlet weak var MeatLoaf: UIButton!
    
    @IBOutlet weak var CarrotCake: UIButton!
    
    @IBOutlet weak var Brownies: UIButton!
    
    var errorMsg = UILabel()
    
    @IBOutlet weak var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CarrotCake.tintColor = .gray
        createButton()
    }
    
    @IBAction func isCookie(_ sender: UIButton) {
        Analytics.shared().track("17: Cookies Selected")
        if Cookies.isSelected == true{
            Cookies.isSelected = false
        }
        else {
            Cookies.isSelected = true
            ApplePie.isSelected = false
            PecanPie.isSelected = false
            MeatLoaf.isSelected = false
            CarrotCake.isSelected = false
            Brownies.isSelected = false
        }
    }
    
    @IBAction func isAnApplePie(_ sender: UIButton) {
        Analytics.shared().track("17: Apple Pie Selected")
        if ApplePie.isSelected == true{
            ApplePie.isSelected = false
        }
        else {
            ApplePie.isSelected = true
            Cookies.isSelected = false
            PecanPie.isSelected = false
            MeatLoaf.isSelected = false
            CarrotCake.isSelected = false
            Brownies.isSelected = false
        }
    }
    
    @IBAction func isPecanPie(_ sender: UIButton) {
        Analytics.shared().track("17: Pecan Pie Selected")
        if PecanPie.isSelected == true{
            PecanPie.isSelected = false
        }
        else {
            PecanPie.isSelected = true
            Cookies.isSelected = false
            ApplePie.isSelected = false
            MeatLoaf.isSelected = false
            CarrotCake.isSelected = false
            Brownies.isSelected = false
        }
    }
    
    @IBAction func isMeatLoaf(_ sender: UIButton) {
        Analytics.shared().track("17: Meat Loaf Selected")
        if MeatLoaf.isSelected == true{
            MeatLoaf.isSelected = false
        }
        else {
            MeatLoaf.isSelected = true
            Cookies.isSelected = false
            ApplePie.isSelected = false
            PecanPie.isSelected = false
            CarrotCake.isSelected = false
            Brownies.isSelected = false
        }
    }
    
    @IBAction func isCarrotCake(_ sender: UIButton) {
        Analytics.shared().track("17: Carrot Cake Selected")
        if CarrotCake.isSelected == false{
            CarrotCake.isSelected = false
        }
        /*
        else {
            CarrotCake.isSelected = true
            Cookies.isSelected = false
            ApplePie.isSelected = false
            PecanPie.isSelected = false
            MeatLoaf.isSelected = false
            Brownies.isSelected = false
        }
         */
    }
    
    @IBAction func isBrownies(_ sender: UIButton) {
        Analytics.shared().track("17: Brownies Selected")
        if Brownies.isSelected == true{
            Brownies.isSelected = false
        }
        else {
            Brownies.isSelected = true
            Cookies.isSelected = false
            ApplePie.isSelected = false
            PecanPie.isSelected = false
            MeatLoaf.isSelected = false
            CarrotCake.isSelected = false
        }
    }
    
    @IBAction func submit(_ sender: UIButton) {
        if Brownies.isSelected == true || Cookies.isSelected == true || ApplePie.isSelected == true || PecanPie.isSelected == true || MeatLoaf.isSelected == true  {
            performSegue(withIdentifier: "submit", sender: self)
        }
        else{
            createErrorMsg()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "submit" {
            let destinationVC = segue.destination as! SubmitViewController
            
            if Cookies.isSelected == true {
                destinationVC.input = "Cookies Selected"
            }
            else if Brownies.isSelected == true{
                destinationVC.input = "Brownies Selected"
            }
            else if ApplePie.isSelected == true{
                destinationVC.input = "Apple Pie Selected"
            }
            else if PecanPie.isSelected == true{
                destinationVC.input = "Pecan Pie Selected"
            }
            else {
                destinationVC.input = "Meat Loaf Selected"
            }
        }
    }
    
    // Creating Buttton
    func createButton(){
        Button.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        Button.layer.cornerRadius = 25.0
        Button.setTitle("Submit", for: .normal)
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
        //Button.centerYAnchor.constraint(equalTo: self.Brownies.bottomAnchor, constant: 50).isActive = true
    }
    
    // Creating Error Message if Needed
    func createErrorMsg(){
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 12.0)
        errorMsg.text = "Please Choose an Option"
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
        errorMsg.centerYAnchor.constraint(equalTo: self.Button.bottomAnchor, constant: 50).isActive = true
    }
}
