//
//  menuViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-03.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class menuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var options = ["Set Security Questions","One-Time Password"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "option", for: indexPath)
        
        cell.selectionStyle = .default
        cell.textLabel!.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            Analytics.shared().track("11: Security Questions Clicked")
            performSegue(withIdentifier: "securityQs", sender: self)
        }
        else{
            performSegue(withIdentifier: "oneTimePassword", sender: self)
            Analytics.shared().track("11: One Time Password Clicked")
        }
    }
    
    @IBOutlet weak var menu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        menu.delegate = self
        menu.dataSource = self
    }
}
