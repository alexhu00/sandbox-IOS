//
//  AddPaymentViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-01.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class AddPaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        print("ran!")

    }
    
    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func changePayment(_ sender: UIButton) {
        showActionSheet()
    }
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let option1 = UIAlertAction(title: "Add Payment Method", style: .default) { action in
            self.performSegue(withIdentifier: "addPayment", sender: self)
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

    
    
}
