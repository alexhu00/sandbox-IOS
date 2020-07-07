//
//  SettingsViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-23.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties
    let settingsArray = ["Logout", "Accessibility Mode", "Entitlement Alerts"]
    //var index = 0

    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //a11yToggle.isOn = false
        ///entitlementsToggle.isOn = false

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = ""
        
        if(indexPath.item == 0){
            cellIdentifier = "cell"
            print("ok")
        }

        if(indexPath.item == 1){
            cellIdentifier = "a11yCell"
            print("good")
        }
        
        if(indexPath.item == 2){
            cellIdentifier = "entitlementsCell"
            print("gr8")
        }
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        
        cell.textLabel?.text = settingsArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            //sleep(1)
            performSegue(withIdentifier: "logout", sender: self)
        }
    }
    
/*
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        if (indexPath.row == 0) {
            //do something
            performSegue(withIdentifier: "logout", sender: self)
        }
    }
    
   */


}
/*
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
         
        return cell
    }
}
*/
