//
//  OneTimeTextField.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-05.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class OneTimeTextField: UITextField {
    
    var didEnterLastDigit: ((String) -> Void)?
    
    var failMsg: ((String) -> Void)?
    
    private var isConfigured = false
    
    private var digitLabels = [UILabel]()
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    func configure(with slotCount: Int = 6){
        guard isConfigured == false else {return}
        isConfigured.toggle()
        configureTextField()
        
        // Create the labels
        let labelsStackView = createLabelsStackView(with: slotCount)
        
        // Tap gesture so when labels are tapped, keyboard is prompted
        addGestureRecognizer(tapRecognizer)
        
        // Add labels to subview
        addSubview(labelsStackView)
        
        // Add contraints as same size of textfield
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureTextField(){
        // Make textfield properties hidden to user
        tintColor = .clear
        textColor = .clear
        // Numberpad instead of keyboard
        keyboardType = .numberPad
        // Auto-populate functionality
        textContentType = .oneTimeCode
        
        // adding target with textDidChange func for everytime user taps on keyboard
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
        delegate = self
    }
    
    // Creating stack view of spaced out lines
    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        // for loop to add labels to label list
        for _ in 1 ... count {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 40)
            label.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
            label.isUserInteractionEnabled = true
            
            stackView.addArrangedSubview(label)
            digitLabels.append(label)
        }
        return stackView
    }
    
    
    // Function called everytime user taps a button on keyboard, basically assigns number to each label
    @objc
    private func textDidChange() {
        guard let text = self.text, text.count <= digitLabels.count else {return}
        
        for i in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[i]
            
            if i < text.count{
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
            }
            else{
                currentLabel.text?.removeAll()
            }
        }
        
        if text.count == digitLabels.count {
            if text == "111111"{
                didEnterLastDigit?(text)
            }
            else{
                failMsg?(text)
            }
        }
    }
}

extension OneTimeTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else {return false}
        
        return characterCount < digitLabels.count || string == ""
    }
    
}
