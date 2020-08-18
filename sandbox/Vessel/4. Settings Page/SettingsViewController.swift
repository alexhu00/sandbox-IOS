//
//  SettingsViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-23.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties
    
    let settingsArray = ["Logout", "Accessibility Mode", "Entitlement Alerts", "Reset App Data"]
    
    let toggles = ["Accessibility Violations", "Visual Differences"]
    
    let actions = ["Logout", "Reset App Data"]

    @IBOutlet weak var tableView: UITableView!

    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //a11yToggle.isOn = false
        ///entitlementsToggle.isOn = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    
    // MARK: Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Number of rows in settings list
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return toggles.count
        }
        else {
            return actions.count
        }
        //return settingsArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Actions"
        }
        else{
            return "Toggles"
        }
    }
    
    // Settings list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = ""
        if indexPath.section == 0{
            if(indexPath.item == 0){
                cellIdentifier = "cell"
                print("ok")
            }
            else{
                cellIdentifier = "dataResetCell"
                print("lit")
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            cell.textLabel?.text = actions[indexPath.row]
            return cell
        }
        else{
            if(indexPath.item == 0){
                cellIdentifier = "a11yCell"
                print("good")
            }
            else{
                cellIdentifier = "visualDiffsCell"
                print("gr8")
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            cell.textLabel?.text = toggles[indexPath.row]
            return cell
        }
    }
    
    // Settings Selection Actions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Logout
        if(indexPath.section == 0 && indexPath.row == 0){
            performSegue(withIdentifier: "logout", sender: self)
            Analytics.shared().track("User logged out of app")
        }
        // Clearing Data
        if(indexPath.section == 0 && indexPath.row == 1){
            createAlert()
        }
    }
    
    // Alert for clearing data
    func createAlert(){
        let alert = UIAlertController(title: "Are you sure you want to reset sandbox app data?", message: "This will reset any data currently stored in the applets", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated:true, completion:nil)
        }))
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: { (action) in
            self.clearData()
            print("alert confirmed")
            alert.dismiss(animated:true, completion:nil)
            
        }))
        self.present(alert, animated:true, completion:nil)
    }
    
    // Function to clear data
    func clearData(){
        Analytics.shared().track("User reset app data")
        print("data cleared!")
        createConfirmationAlert()
        
        // Clearing Add to Cart Applet Data
        cartItems.productList = []
        cartItems.listofProducts = []
        cartItems.totalCount = 0
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: keys.cartEdited)
        
        // Clearing slider values
        defaults.set(false, forKey: keys.volumeChanged)
        defaults.set(false, forKey: keys.brightChanged)

    }
    
    // Confirmation Alert for clearing data
    func createConfirmationAlert(){
        let alert = UIAlertController(title: "App Data Reset", message: "Data previously stored in the applets has been cleared", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action) in
            print("confirm alert confirmed")
            alert.dismiss(animated:true, completion:nil)
        }))
        self.present(alert, animated:true, completion:nil)
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
