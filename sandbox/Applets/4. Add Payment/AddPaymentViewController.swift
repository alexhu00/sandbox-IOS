//
//  AddPaymentViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-01.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class AddPaymentViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var confirmationLabel: UILabel!
    
    var text: String? {
        didSet{
            updateLabel()
        }
    }

    @IBOutlet weak var confirmNum: UILabel!
    
    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func changePayment(_ sender: UIButton) {
        showActionSheet()
    }

    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        print("ran!")
        //AddingScreenViewController().cardDelegate = self
        confirmNum.text = text ?? "9452"
    }
    
    // MARK: Functions
    
    func updateLabel(){
        confirmNum.text = text
    }
    
    func showActionSheet() {
        Analytics.shared().track("4: Action Sheet Shown")
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let option1 = UIAlertAction(title: "Add Payment Method", style: .default) { action in
            let selectionVC = self.storyboard!.instantiateViewController(withIdentifier: "AddingScreenViewController") as! AddingScreenViewController
            selectionVC.cardDelegate = self
            self.present(selectionVC, animated: true, completion: nil)
        }
        //let option3 = UIAlertAction(title: "Option", style: .default, handler: performSegue(withIdentifier: "addPayment", sender: self))
        let option2 = UIAlertAction(title: "Use Saved Method", style: .default, handler: nil)
        actionSheet.addAction(cancel)
        actionSheet.addAction(option1)
        actionSheet.addAction(option2)
        present(actionSheet, animated: true, completion: nil)
    }
    
    func createButton(){
        //Button.isHidden = true
        print("ran create!")
        Button.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        Button.layer.cornerRadius = 25.0
        Button.setTitle("Continue", for: .normal)
        Button.setTitleColor(.white, for: .normal)
        Button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20.0)
        //view.addSubview(Button)
        scrollView.delaysContentTouches = false
        setButtonContrainsts()
    }
    
    func setButtonContrainsts() {
        print("ran set!")
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        Button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //Button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 580).isActive = true
    }

    
    @IBAction func payment(_ sender: UIButton) {
        performSegue(withIdentifier: "payment", sender: self)
    }
    
}

// MARK: Delegate Function

extension AddPaymentViewController: creditCardDelegate {
    func changePayment(cardNum: String) {
        confirmNum.text = cardNum
    }
}

/*
 print(cardNum)
 print(confirmNum)
 //confirmNum.text = String (cardNum)
 print("ran!!! \n")
 */

   /*
   override func viewWillAppear(_: Bool) {
           super.viewWillAppear(true)

           //call your data populating/API calls from here
   }
   
   override func viewWillAppear(_ animated: Bool){
       UIViewController.reloadData()
   }
*/
