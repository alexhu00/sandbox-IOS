//
//  RatingControl.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-20.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

// NOTE: A UIStackView was created in the story board and that UIStackView's class was set to this one which is why we can add buttons using "addArrangedSubview(button)" to that stackview

@IBDesignable class RatingControl: UIStackView {  // @IBDesignable allows the rating to be seen on storyboard
    
    // MARK: Properties
    
    var a11y = settings.a11yIsOn
    
    // Array of Buttons created so that setupButtons() method puts buttons in here and we can access each one
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet{
            updateButtonSelectionStates()
        }
    }
    
    // Creates section in the right panel of storyboard where you can change width and height of stars
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButtons()  // didSet alerts that values were changed in right panel and so calls function here to update the width and height from its default values which are 44.0 and 44.0
        }
    }
    
    @IBInspectable var starCount: Int = 5{
        didSet{
            setupButtons()
        }
    }
    
    
    // MARK: Intialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) { // Since we are using xCode we also need to initalize this
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Button Action
    @objc func ratingButtonTapped(button:UIButton){  //NOTE: Interaction was initalized in setUpButtons
        
        guard let ratingIndex = ratingButtons.firstIndex(of: button) else{
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        if (ratingIndex + 1) == rating {
            rating = 0
        }
        else{
            rating = (ratingIndex + 1)
        }
        print("button pressed")
    }

    
    // MARK: Private Methods
    private func setupButtons() {
        // clear any existing buttons. Done so that if you change number of buttons or size for eg. it replaces ont the old stars
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        let bundle = Bundle(for:type(of: self))
        let emptyStar = UIImage(named: "icons8-star-50", in: bundle, compatibleWith: self.traitCollection)
        let filledStar = UIImage(named: "icons8-star-50 (1)", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"icons8-star-50 (1)", in: bundle, compatibleWith: self.traitCollection)
        
        // For loop to create 5 buttons
        for index in 1...starCount{

            // Creates Button
            let button = UIButton()
            
            // Setting images of each of the buttons based on conditions, NOTE: 2nd argument are all UIControl.State properties
            button.setImage(emptyStar, for: UIControl.State.normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Add accessibility label (A short, localized word or phrase that succinctly describes the control or view, but does not identify the element’s type. Examples are “Add” or “Play.)
            if a11y{
                button.accessibilityLabel = "\(index) star"
            }
            else{
                button.accessibilityLabel = "Set \(index) star rating"
            }
            

            // Give button some interaction using ratingButtonTapped func defined above
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the button to the rating buttons array
            ratingButtons.append(button)
            
        }
        //updateButtonSelectionStates()
        
    }
    
    /*  Shit version using if else statements
    private func updateButtonSelectionStates(){
        for button in ratingButtons {
            if ratingButtons.firstIndex(of: button)! < rating{
                button.isSelected = true
            }
            else{
                button.isSelected = false
            }
        }
    }
 */
    // Better version using enumeration of an array
    private func updateButtonSelectionStates(){
        for (index, button) in ratingButtons.enumerated(){
            button.isSelected = index < rating
           
            // Acessibility hint: Tap to reset rating, gives user hint if necessary
            switch rating == (index+1) {
            case true:
                button.accessibilityHint = "Tap to reset rating"
            default:
                button.accessibilityHint = nil
            }
            
            // Acessibility value: No rating, 1 star set, x stars set, gives uer info about current state
            switch rating {
            case 0:
                button.accessibilityValue = "No rating"
            case 1:
                button.accessibilityValue = "1 star set"
            default:
                button.accessibilityValue = "\(rating) stars set"
            }
        }
    }
}






/*
import UIKit
 
@IBDesignable class RatingControl: UIStackView {
   
    //MARK: Properties
    
    private var ratingButtons = [UIButton]()
     
    var rating = 0
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5{
        didSet {
            setupButtons()
        }
    }
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
     
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Functions
    
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    
    private func setupButtons() {
        
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
}
*/
