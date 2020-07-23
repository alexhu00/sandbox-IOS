//
//  VesselViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-23.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

struct applet {
    var appletName : String
    var appletIcon : UIImage
    var segue : String
}

class VesselViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    // MARK: Properties
    
    let section = ["E-Commerce", "UI Elements", "Entitlements"] // add "Content later

    var applets : [applet] = [
        applet(appletName: "Create Account", appletIcon: #imageLiteral(resourceName: "Icon Path"), segue: "applet1"),
        applet(appletName: "Login", appletIcon: #imageLiteral(resourceName: "icons8-enter-30.png"), segue: "applet7"),
        applet(appletName: "Add Credit Card", appletIcon: #imageLiteral(resourceName: "icons8-credit-card-30"), segue: "applet2"),
        applet(appletName: "Add to Cart", appletIcon: #imageLiteral(resourceName: "supermarket (2)"), segue: "applet6"),
        applet(appletName: "Account Settings", appletIcon: #imageLiteral(resourceName: "Icon Shape"), segue: "applet8"),
        applet(appletName: "Rating Stars", appletIcon: #imageLiteral(resourceName: "icons8-star-50 (1)"), segue: "applet10")
    ]

    var UIapplets : [applet] = [
        applet(appletName: "Explore Sliders", appletIcon: #imageLiteral(resourceName: "icons8-slider-30"), segue: "applet3"),
    ]

    var contentApplets : [applet] = [
        applet(appletName: "Create Account", appletIcon: #imageLiteral(resourceName: "Combined Shape"), segue: "applet1"),
        applet(appletName: "Add to Cart", appletIcon: #imageLiteral(resourceName: "supermarket (2)"), segue: "applet2"),
    ]

    var entitlementsApplets : [applet] = [
        applet(appletName: "Open Camera", appletIcon: #imageLiteral(resourceName: "icons8-camera-30"), segue: "applet4"),
        applet(appletName: "Location", appletIcon: #imageLiteral(resourceName: "icons8-marker-31"), segue: "applet5"),
        applet(appletName: "Access Contacts", appletIcon: #imageLiteral(resourceName: "icons8-bookmark-30"), segue: "applet9")
    ]
    
    lazy var appletsFullList = [applets, UIapplets, entitlementsApplets] // add contentApplets later

    @IBOutlet weak var List: UITableView!
    
    @IBOutlet weak var Filter: UIButton!
    
    @IBOutlet weak var search: UISearchBar!
    
    @IBOutlet weak var searchIconViolation: UIImageView!
    
    @IBOutlet weak var headerMesmerLogo: UIImageView!
    
    var sectionSearch = [String]()
    
    var searchApplet = [[applet]]()
    
    var searching = false
    
    var searchApplets = [applet]()
    
    var searchUIApplets = [applet]()
    
    var searchEntitlemnts = [applet]()
    
    var a11y = false
    
    var visualDiffs = false
    
    // MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        List.delegate = self
        List.dataSource = self
        List.rowHeight = UITableView.automaticDimension
        List.estimatedRowHeight = 500
        search.delegate = self
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        setA11yCorrect()
        //self.tab
    }
    
    override func viewDidAppear(_ animated: Bool) {
        a11y = settings.a11yIsOn
        if (a11y){
            setA11yViolations()
        }
        else{
            setA11yCorrect()
        }
        visualDiffs = settings.visualDiffsOn
        if (visualDiffs){
            visualDifferences()
        }
        else{
            originalVisual()
        }
    }
    
    // MARK: Functions
    
    func visualDifferences(){
        headerMesmerLogo.image = #imageLiteral(resourceName: "mesmerHeader")
        appletsFullList[0][3].appletIcon = #imageLiteral(resourceName: "icons8-shopping-cart-30")
        List.reloadData()
        self.tabBarItem.image = #imageLiteral(resourceName: "homeCombined Shape")
        self.tabBarItem.selectedImage = #imageLiteral(resourceName: "homeCombined Shape")
        /*
        homeIcon.image = #imageLiteral(resourceName: "icons8-bookmark-30")
        homeIcon.selectedImage = #imageLiteral(resourceName: "icons8-bookmark-30")
 */
    }
    func originalVisual(){
        headerMesmerLogo.image = #imageLiteral(resourceName: "Screen Shot 2020-06-30 at 3.32.58 PM")
        appletsFullList[0][3].appletIcon = #imageLiteral(resourceName: "supermarket (2)")
        List.reloadData()
        /*
        homeIcon.image = #imageLiteral(resourceName: "homeCombined Shape")
        homeIcon.selectedImage = #imageLiteral(resourceName: "homeCombined Shape")
    */
    }
    
    // Setting Correct a11y Features
    func setA11yCorrect() {
        if let textFieldInsideSearchBar = self.search.value(forKey: "searchField") as? UITextField {
            textFieldInsideSearchBar.leftView?.isHidden = false
        }
        searchIconViolation.isHidden = true
    }
    
    // Setting a11y Violations
    func setA11yViolations() {
        if let textFieldInsideSearchBar = self.search.value(forKey: "searchField") as? UITextField {
            textFieldInsideSearchBar.leftView?.isHidden = true
        }
        searchIconViolation.isHidden = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search.resignFirstResponder()
    }

    @IBAction func filterTapped(_ sender: UIButton) {
        print("hi")
    }
    
    // Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        if searching{
            return self.searchApplet.count
        }
        else{
            return self.section.count
        }
    }
    
    // Title of Each Section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searching{
            return self.sectionSearch[section]
        }
        else{
            return self.section[section]
        }
    }
    
    // Number of Rows in Each Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchApplet[section].count
        }
        else{
            return appletsFullList[section].count
        }
        //print(appletsFullList[section].count)

    }
    
    // Intializing What Image and Label is in Each Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier = "appletCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AppletTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        if searching {
            cell.appletLabel?.text = searchApplet[indexPath.section][indexPath.row].appletName
            cell.appletIcon?.image = searchApplet[indexPath.section][indexPath.row].appletIcon
        }
        else{
            cell.appletLabel?.text = appletsFullList[indexPath.section][indexPath.row].appletName
            cell.appletIcon?.image = appletsFullList[indexPath.section][indexPath.row].appletIcon
        }
        cell.appletIcon?.image = (cell.appletIcon.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        cell.appletIcon?.tintColor = .init(red: 248/255, green: 19/255, blue: 179/255, alpha: 1)


        return cell
    }
    
    // What Happens After Clicking on a Row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: appletsFullList[indexPath.section][indexPath.row].segue, sender: self)
    }
    
    // Unwind Function
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        
    }
    
}

// Search Bar Extension
extension VesselViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //searchApplet = appletsFullList.filter({$0.applet.appletName.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searchApplets = applets.filter({$0.appletName.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searchUIApplets = UIapplets.filter({$0.appletName.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searchEntitlemnts = entitlementsApplets.filter({$0.appletName.lowercased().prefix(searchText.count) == searchText.lowercased()})
            //entitlementsApplets.filter({$0.appletName.lowercased().contains(searchText.lowercased())})
        
        for i in searchApplets{
            print(i.appletName)
        }
        /*
        if(searchApplets.count != 0){
            searchApplet.append(searchApplets)
            sectionSearch.append("E-Commerce")
        }
        if(searchUIApplets.count != 0){
            searchApplet.append(searchUIApplets)
            sectionSearch.append("UI Elements")
        }
        if(searchEntitlemnts.count != 0){
            searchApplet.append(searchEntitlemnts)
            sectionSearch.append("Entitlements")
        }
 */
        searchApplet = [searchApplets, searchUIApplets, searchEntitlemnts]
        sectionSearch = ["E-Commerce", "UI Elements", "Entitlements"]

        if (searchApplets.count == 0) {
            searchApplet = [searchUIApplets, searchEntitlemnts]
            sectionSearch = ["UI Elements", "Entitlements"]
        }
        if (searchUIApplets.count == 0) {
            searchApplet = [searchApplets, searchEntitlemnts]
            sectionSearch = ["E-Commerce", "Entitlements"]
        }
        if (searchEntitlemnts.count == 0) {
            searchApplet = [searchApplets, searchUIApplets]
            sectionSearch = ["E-Commerce", "UI Elements"]
        }
        if (searchApplets.count == 0 && searchUIApplets.count == 0) {
            searchApplet = [searchEntitlemnts]
            sectionSearch = ["Entitlements"]
        }
        if (searchEntitlemnts.count == 0 && searchUIApplets.count == 0) {
            searchApplet = [searchApplets]
            sectionSearch = ["E-Commerce"]
        }
        if (searchApplets.count == 0 && searchEntitlemnts.count == 0) {
            searchApplet = [searchUIApplets]
            sectionSearch = ["UI Elements"]
        }
        if (searchApplets.count == 0 && searchEntitlemnts.count == 0 && searchUIApplets.count == 0) {
            searchApplet = []
            sectionSearch = []
        }
        
        //searchApplet = [searchApplets, searchUIApplets, searchEntitlemnts]
        searching = true
        List.reloadData()
    }
}

/*
 
 func createAppletList(){
     applets.append(applet(appletName: "Create Account", appletIcon: #imageLiteral(resourceName: "Screen Shot 2020-06-24 at 12.46.40 PM"), segue: "applet1"))
     applets.append(applet(appletName: "Add to Cart", appletIcon: #imageLiteral(resourceName: "Screen Shot 2020-06-24 at 12.46.40 PM"), segue: "applet2"))
     applets.append(applet(appletName: "Manage Cart", appletIcon: #imageLiteral(resourceName: "Screen Shot 2020-06-24 at 12.46.40 PM"), segue: "applet3"))
     applets.append(applet(appletName: "Manage Cart", appletIcon: #imageLiteral(resourceName: "Screen Shot 2020-06-24 at 12.46.40 PM"), segue: "applet4"))
     
 }
     
 
 
 
 
 
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return applets.count
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "appletCell", for: indexPath)

     cell.textLabel!.text = applets[indexPath.row]
     
     //cell.imageView!.image = UIImage(named: "CreateAccountIcon")
     
     return cell
 }
 
 */
