//
//  SliderViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-29.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    // MARK: Properties

    var section = ["Volume", "Brightness"]
    
    var cellIdentifier = "sliderCell"
    
    var tableViewCellKind: String = ""
    
    @IBOutlet weak var volumeLabel: UILabel!
    
    @IBAction func moveSlider(_ sender: UISlider) {
        let currentValue = Int(sender.value*100)
        volumeLabel.text = "\(currentValue)"
    }
    
    @IBOutlet weak var brightnessLabel: UILabel!
    
    @IBAction func moveSlider2(_ sender: UISlider) {
        let currentValue = Int(sender.value*100)
        brightnessLabel.text = "\(currentValue)"
    }
    
    @IBOutlet weak var List: UITableView!
    
    var a11y = settings.a11yIsOn
    
    var volume = 0
    
    var brightness = 0
    

    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        List.delegate = self
        List.dataSource = self
        List.isScrollEnabled = false
        //volume = VolumeTableViewCell.volume
        //brightness = BrightTableViewCell.brightness

    }
    
    
    // MARK: Functions
    
    // Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Title of Each Section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    // Number of Rows in Each Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Tableview Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cellIdentifier = "sliderCell"
       
        if(indexPath.section == 0){
            cellIdentifier = "sliderCell"
            print("ok")
        }

        if(indexPath.section == 1){
            cellIdentifier = "sliderCell2"
            print("good")
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        return cell
    }
}


       //a11y =
       /*
       if (a11y) {
           setA11y1()
       }
       else{
           setA11y2()
       }
*/

//var vs = VolumeTableViewCell()
//var volumeSlider = vs.volumeSlider
//var bs = BrightTableViewCell()
//var volumeSlider = bs.brightSlider


   /*
   @IBOutlet weak var slider: UISlider!
   
   @IBOutlet weak var slider2: UISlider!
   
   lazy var volume = slider.value
*/
   

/*
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

*/
