//
//  AccountAppletViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-19.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import SafariServices
import Analytics

class AccountAppletViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var options = ["Profile","Terms and Conditions", "Call Mesmer", "Find a Store Near Me"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "options", for: indexPath)
            cell.selectionStyle = .default
            cell.textLabel!.text = options[indexPath.row - 1]
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1{
            Analytics.shared().track("8: Clicked on profile")
            performSegue(withIdentifier: "profile", sender: self)
        }
        else if indexPath.row == 2 {
            Analytics.shared().track("8: Clicked on Mesmer web link")
            let vc = SFSafariViewController(url: URL(string: "https://mesmerhq.com/terms")!)
            present(vc, animated: true)
        }
        else if indexPath.row == 3{
            Analytics.shared().track("8: Clicked on Mesmer phone number")
            makePhoneCall(phoneNumber: "+1-702-886-9928")
        }
        else{
            Analytics.shared().track("8: Clicked on find store")
            performSegue(withIdentifier: "findStore", sender: self)
        }

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
    
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
    }
    
    

}
