//
//  AccountAppletViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-19.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import SafariServices

class AccountAppletViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBAction func edit(_ sender: Any) {
        performSegue(withIdentifier: "edit", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
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
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SFSafariViewController(url: URL(string: "https://mesmerhq.com/terms")!)
        present(vc, animated: true)
    }
    
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
    }
    
    

}
