//
//  QuestionsViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-04.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class QuestionsViewController: UIViewController {
    
    var startingQs = ["What is your dog's name?", "Where were you born?", "What is your grandpa's fist name?"]
    
    var otherOptions1 = ["What is your cat's name?", "Where was your mother born?", "When is you grandma's birthday?"]
    
    var otherOptions2 = ["What is your favourite sport?", "Where was your dad born?", "When is you grandpa's birthday?"]
    
    var otherOptions3 = ["What was the name of your primary school?", "Where was younger sibling born?", "What is your grandma's first name?"]
    
    var selectedQ : String?
    
    var currentTextField = UITextField()
    
    var picker = UIPickerView()
    
    var errorMsg = UILabel()
    
    @IBOutlet var answers:[UITextField]!
    
    @IBOutlet var questions:[UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions[0].delegate = self
        questions[1].delegate = self
        questions[2].delegate = self
    }

    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        var filled = true
        for i in 0..<3{
            let q = questions[i].text
            let a = answers[i].text
            if q!.isEmpty || a!.isEmpty {
                filled = false
            }
        }
        if filled{
            performSegue(withIdentifier: "test", sender: self)
        }
        else{
            createErrorMsg()
        }
    }
    
    // Creating Error Message if Needed
    func createErrorMsg(){
        Analytics.shared().track("11: Security Qs Not All Fields Filled")
        errorMsg.font = UIFont(name: "Roboto-Bold", size: 12.0)
        errorMsg.text = "Please fill in all questions"
        errorMsg.textColor = UIColor(ciColor: .red)
        errorMsg.textAlignment = .center
        view.addSubview(errorMsg)
        setErrorMsgContrainsts()
    }
    
    func setErrorMsgContrainsts() {
        errorMsg.translatesAutoresizingMaskIntoConstraints = false
        errorMsg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        errorMsg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        errorMsg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        errorMsg.centerYAnchor.constraint(equalTo: self.questions[2].bottomAnchor, constant: 150).isActive = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "test" {
            Analytics.shared().track("11: Valid Security Qs Were Set")
            let num = Int.random(in: 0 ..< 3)
            let randomQ = questions[num].text
            let randomA = answers[num].text
            
            let destinationVC = segue.destination as! TestQuestionViewController
            destinationVC.q = randomQ
            destinationVC.a = randomA
        }
    }

}

extension QuestionsViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Number of options in each picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextField == questions[0]{
            return otherOptions1.count
        }
        else if currentTextField == questions[1]{
            return otherOptions2.count
        }
        else{
            return otherOptions3.count
        }
    }
    
    // Titles of options in each picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextField == questions[0]{
            return otherOptions1[row]
        }
        else if currentTextField == questions[1]{
            return otherOptions2[row]
        }
        else{
            return otherOptions3[row]
        }
    }
    
    // Setting selected questions as the new question
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextField == questions[0]{
            Analytics.shared().track("11: Q1 Prompt Selected")
            questions[0].text = otherOptions1[row]
            self.view.endEditing(true)
        }
        else if currentTextField == questions[1]{
            Analytics.shared().track("11: Q2 Prompt Selected")
            questions[1].text = otherOptions2[row]
            self.view.endEditing(true)
        }
        else{
            Analytics.shared().track("11: Q3 Prompt Selected")
            questions[2].text = otherOptions3[row]
            self.view.endEditing(true)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == questions[0] || textField == questions[1] || textField == questions[2]  {
            picker.delegate = self
            picker.dataSource = self
            currentTextField = textField
            currentTextField.inputView = picker
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == questions[0] || textField == questions[1] || textField == questions[2]  {
            return false
        }
        else{
            return true
        }
    }
    
    
    
    
}
