//
//  contactsViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-19.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import ContactsUI


class contactsViewController: UIViewController, CNContactPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func contacts(_ sender: UIButton) {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        self.present(contactPicker, animated: true, completion: nil)
    }
    
}
