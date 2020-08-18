//
//  securityQsViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-03.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class securityQsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var startingQs = ["What was your first grade teacher's last name?", "Where were you born?", "What is your grandpa's fist name?"]
    
    var otherOptions = ["What was your second grade teacher's last name?", "Where was your mother born?", "When is you grandma's birthday?"]
    
    var selectedQ : String?
    
    @IBOutlet weak var questionsTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "question", for: indexPath) as! questionTableViewCell
            cell.questionNumber.text = "Question \(indexPath.row/2 + 1)"
            cell.questionText.text = startingQs[indexPath.row % 2]

            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "textField") as! textFieldTableViewCell
            let tf = UITextField(frame: CGRect(x: 20, y: 10, width: 300, height: 20))
            tf.placeholder = "Enter text here"
            tf.font = UIFont.systemFont(ofSize: 15)
            
            cell.contentView.addSubview(tf)
            cell.addSubview(tf)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        questionsTable.delegate = self
        questionsTable.dataSource = self
    }
    
}

extension securityQsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return otherOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return otherOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedQ = otherOptions[row]
    }
    
}
