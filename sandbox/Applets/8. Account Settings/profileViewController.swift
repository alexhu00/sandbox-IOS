//
//  profileViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-03.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func edit(_ sender: Any) {
        performSegue(withIdentifier: "edit", sender: self)
    }

    @IBAction func email(_ sender: Any) {
        let email = "alex@mesmerhq.com"
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
    }
    
    @IBAction func phone(_ sender: Any) {
        makePhoneCall(phoneNumber: "+1-123-456-7891")
        
    }
    
    func makePhoneCall(phoneNumber: String) {
        if let phoneURL = NSURL(string: ("tel://" + phoneNumber)) {
            let alert = UIAlertController(title: ("Call " + phoneNumber + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL)
            }))
      
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    
            self.present(alert, animated: true, completion: nil)
        }
    }

}
