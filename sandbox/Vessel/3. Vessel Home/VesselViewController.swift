//
//  VesselViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-23.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

struct applet {
    var appletName : String
    var appletIcon : UIImage
    var segue : String
}

class VesselViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    // MARK: Properties
    
    let section = ["E-Commerce", "UI Elements", "Entitlements", "Complex Interactions"]

    var ecommerceApplets : [applet] = [
        applet(appletName: "Create Account", appletIcon: #imageLiteral(resourceName: "Icon Path"), segue: "applet1"),
        applet(appletName: "Login", appletIcon: #imageLiteral(resourceName: "icons8-enter-30.png"), segue: "applet7"),
        applet(appletName: "Add Credit Card", appletIcon: #imageLiteral(resourceName: "icons8-credit-card-30"), segue: "applet2"),
        applet(appletName: "Add to Cart", appletIcon: #imageLiteral(resourceName: "supermarket (2)"), segue: "applet6"),
        applet(appletName: "Account Settings", appletIcon: #imageLiteral(resourceName: "icons8-settings-50"), segue: "applet8"),
        applet(appletName: "Rating Stars", appletIcon: #imageLiteral(resourceName: "icons8-star-50 (1)"), segue: "applet10"),
        applet(appletName: "Checkout", appletIcon: #imageLiteral(resourceName: "icons8-truck-30"), segue: "applet16")
    ]

    var UIapplets : [applet] = [
        applet(appletName: "Explore Sliders", appletIcon: #imageLiteral(resourceName: "icons8-slider-30"), segue: "applet3"),
        applet(appletName: "Data Table", appletIcon: #imageLiteral(resourceName: "icons8-data-grid-30"), segue: "applet17"),
        applet(appletName: "Radio Buttons", appletIcon: #imageLiteral(resourceName: "radio-button-checked-1780884-1514128"), segue: "applet18")
    ]

    var entitlementsApplets : [applet] = [
        applet(appletName: "Open Camera", appletIcon: #imageLiteral(resourceName: "icons8-camera-30"), segue: "applet4"),
        applet(appletName: "Location", appletIcon: #imageLiteral(resourceName: "icons8-marker-31"), segue: "applet5"),
        applet(appletName: "Access Contacts", appletIcon: #imageLiteral(resourceName: "icons8-bookmark-30"), segue: "applet9"),
        applet(appletName: "Biometric ID", appletIcon: #imageLiteral(resourceName: "icons8-fingerprint-accepted-30"), segue: "applet12"),
        applet(appletName: "Storage Access", appletIcon: #imageLiteral(resourceName: "icons8-folder-30"), segue: "applet19")
    ]
    
    var ComplexInteractions: [applet] = [
        applet(appletName: "Security Questions", appletIcon: #imageLiteral(resourceName: "icons8-lock-30"), segue: "applet11"),
        applet(appletName: "Device Rotation", appletIcon: #imageLiteral(resourceName: "icons8-rotation-30"), segue: "applet13"),
        applet(appletName: "External App Link", appletIcon: #imageLiteral(resourceName: "icons8-external-link-50"), segue: "applet14"),
        applet(appletName: "Video Player", appletIcon: #imageLiteral(resourceName: "icons8-play-button-circled-30"), segue: "applet15")
    ]
    
    lazy var appletsFullList = [ecommerceApplets, UIapplets, entitlementsApplets, ComplexInteractions]

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
    
    var searchComplexInteractions = [applet]()
    
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
        Analytics.shared().screen("Vessel Home Screen")
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
    }
    
    func originalVisual(){
        headerMesmerLogo.image = #imageLiteral(resourceName: "Screen Shot 2020-06-30 at 3.32.58 PM")
        appletsFullList[0][3].appletIcon = #imageLiteral(resourceName: "supermarket (2)")
        List.reloadData()
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
        Analytics.shared().track("\(appletsFullList[indexPath.section][indexPath.row].appletName) Applet Selected")
    }
    
    // Unwind Function
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        
    }
    
}

// Search Bar Extension
extension VesselViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //searchApplet = appletsFullList.filter({$0.applet.appletName.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searchApplets = ecommerceApplets.filter({$0.appletName.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searchUIApplets = UIapplets.filter({$0.appletName.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searchEntitlemnts = entitlementsApplets.filter({$0.appletName.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searchComplexInteractions = ComplexInteractions.filter({$0.appletName.lowercased().prefix(searchText.count) == searchText.lowercased()})
            //entitlementsApplets.filter({$0.appletName.lowercased().contains(searchText.lowercased())})
        
        for i in searchApplets{
            print(i.appletName)
        }

        
        // 4 results (4 choose 4)
        searchApplet = [searchApplets, searchUIApplets, searchEntitlemnts, searchComplexInteractions]
        sectionSearch = ["E-Commerce", "UI Elements", "Entitlements", "Complex Interactions"]

        
        //  3 results (4 choose 3)
        if (searchApplets.count == 0) {
            searchApplet = [searchUIApplets, searchEntitlemnts, searchComplexInteractions]
            sectionSearch = ["UI Elements", "Entitlements", "Complex Interactions"]
        }
        if (searchUIApplets.count == 0) {
            searchApplet = [searchApplets, searchEntitlemnts, searchComplexInteractions]
            sectionSearch = ["E-Commerce", "Entitlements", "Complex Interactions"]
        }
        if (searchEntitlemnts.count == 0) {
            searchApplet = [searchApplets, searchUIApplets, searchComplexInteractions]
            sectionSearch = ["E-Commerce", "UI Elements", "Complex Interactions"]
        }
        if (searchComplexInteractions.count == 0) {
            searchApplet = [searchApplets, searchUIApplets, searchEntitlemnts]
            sectionSearch = ["E-Commerce", "UI Elements", "Entitlements"]
        }
    
        // 2 results (4 choose 2)
        if (searchUIApplets.count == 0 && searchEntitlemnts.count == 0) {
            searchApplet = [searchApplets, searchComplexInteractions]
            sectionSearch = ["E-Commerce", "Complex Interactions"]
        }
        if (searchEntitlemnts.count == 0 && searchComplexInteractions.count == 0) {
            searchApplet = [searchApplets, searchUIApplets]
            sectionSearch = ["E-Commerce", "UI Elements"]
        }
        if (searchComplexInteractions.count == 0 && searchUIApplets.count == 0) {
            searchApplet = [searchApplets, searchEntitlemnts]
            sectionSearch = ["E-Commerce", "Entitlements"]
        }
        if (searchApplets.count == 0 && searchUIApplets.count == 0) {
            searchApplet = [searchEntitlemnts, searchComplexInteractions]
            sectionSearch = ["Entitlements", "Complex Interactions"]
        }
        if (searchApplets.count == 0 && searchComplexInteractions.count == 0 ) {
            searchApplet = [searchEntitlemnts, searchUIApplets]
            sectionSearch = ["Entitlements", "UI Elements"]
        }
        if (searchApplets.count == 0 && searchEntitlemnts.count == 0 ) {
            searchApplet = [searchUIApplets, searchComplexInteractions]
            sectionSearch = ["UI Elements", "Complex Interactions"]
        }
        
        
        // 1 Result (4 choose 1)
        if (searchApplets.count == 0 && searchUIApplets.count == 0 && searchComplexInteractions.count == 0) {
            searchApplet = [searchEntitlemnts]
            sectionSearch = ["Entitlements"]
        }
        if (searchEntitlemnts.count == 0 && searchUIApplets.count == 0 && searchComplexInteractions.count == 0) {
            searchApplet = [searchApplets]
            sectionSearch = ["E-Commerce"]
        }
        if (searchApplets.count == 0 && searchEntitlemnts.count == 0 && searchComplexInteractions.count == 0) {
            searchApplet = [searchUIApplets]
            sectionSearch = ["UI Elements"]
        }
        if (searchApplets.count == 0 && searchEntitlemnts.count == 0 && searchUIApplets.count == 0) {
            searchApplet = [searchComplexInteractions]
            sectionSearch = ["Complex Interactions"]
        }
        
        // No results (4 choose 0)
        if (searchApplets.count == 0 && searchEntitlemnts.count == 0 && searchUIApplets.count == 0 && searchComplexInteractions.count == 0) {
            searchApplet = []
            sectionSearch = []
        }

        searching = true
        List.reloadData()
    }
}

