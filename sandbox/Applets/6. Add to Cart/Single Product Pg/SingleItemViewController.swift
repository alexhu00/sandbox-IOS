//
//  SingleItemViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-10.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class SingleItemViewController: UIViewController {

    @IBOutlet weak var singleItemImage: UIImageView!
    
    @IBOutlet weak var singleItemName: UILabel!
    
    @IBOutlet weak var singleItemPrice: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var productDescription: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var cartCount: UIView!
    
    @IBOutlet weak var cartCountNum: UILabel!
    
    @IBOutlet weak var Button: UIButton!
    
    let defaults = UserDefaults.standard


    //@IBOutlet weak var space: UILabel!
    
    var image: UIImage?
    var name: String?
    var price: String?
    var productText: String?

        
    override func viewDidLoad() {
        super.viewDidLoad()
        //space.text = blank
        singleItemImage.image = image
        singleItemName.text = name
        singleItemPrice.text = price
        singleItemName.sizeToFit()
        singleItemPrice.sizeToFit()
        productDescription.text = productText
        productDescription.sizeToFit()
        cardView.layer.cornerRadius = 10
        createButton()
        cartCountNum.text = String(cartItems.totalCount)
        cartCount.isHidden = false
        //cartCount.isHidden = cartItems.cartCountHidden
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.cartCountNum.text = String(cartItems.totalCount)
    }
    
    
    @IBAction func viewCart(_ sender: UIButton) {
        performSegue(withIdentifier: "viewCart", sender: self)
    }
    
    
    @IBAction func addToCart(_ sender: Any) {
        createAlert()
    }
    
    func createAlert() {
        let alert = UIAlertController(title: "Add Item to Cart?", message: "You currently have \(cartItems.totalCount) item(s) in your cart", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title:"Cancel", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated:true, completion:nil)
        }))
        
        alert.addAction(UIAlertAction(title:"Confirm", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated:true, completion:nil)
            self.addingToCart()
        }))

        self.present(alert, animated:true, completion:nil)
    }
    
    func addingToCart(){
        Analytics.shared().track("6: \(self.singleItemName.text) Added to Cart")
    
        defaults.set(true, forKey: keys.cartEdited)

        // Check if item is already in cart
        if !cartItems.listofProducts.contains(singleItemName.text!) {

            cartItems.productList.append(cartList(productName: singleItemName.text!, productPrice: singleItemPrice.text!, qty: 1))
            cartItems.listofProducts.append(singleItemName.text!)
            cartItems.productQty.append(1)
            cartItems.productPrice.append(singleItemPrice.text!)
        }
            
        // If item is already in cart, then add 1 to its' qty
        else {
            let itemIndex = cartItems.listofProducts.firstIndex(of: singleItemName.text!)!
            cartItems.productList[itemIndex].qty += 1
            cartItems.productQty[itemIndex] += 1
            
        }
        
        // Setting user defaults
        cartItems.findTotalCount()
        
        defaults.set(cartItems.totalCount, forKey: keys.totalCount)
        defaults.set(cartItems.listofProducts, forKey: keys.listofProducts)
        defaults.set(cartItems.productQty, forKey: keys.productQty)
        defaults.set(cartItems.productPrice, forKey: keys.price)
        
        // Animation for the cart icon, for the first item
        if cartItems.totalCount == 1 {
            //cartItems.cartCountHidden = false
            cartItems.cartCountHidden = true
            cartCountNum.text = String(cartItems.totalCount)
            UIView.transition(with: cartCount, duration: 0.4,
                options: .transitionFlipFromLeft,
                animations: {
                    self.cartCount.isHidden = false
                    //self.cartCount.isHidden = cartItems.cartCountHidden
            })
        }
        // Animation for the cart icon
        else{
            cartCountNum.text = String(cartItems.totalCount)

            self.cartCount.isHidden = true
            UIView.transition(with: cartCount, duration: 0.4, options: .transitionFlipFromLeft, animations: {
                //self.cartCount.isHidden = cartItems.cartCountHidden
                self.cartCount.isHidden = false
            }, completion: nil)
        }
    }
    
    func createButton(){
        //Button.isHidden = true
        Button.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        Button.layer.cornerRadius = 25.0
        Button.setTitle("Add to Cart", for: .normal)
        Button.setTitleColor(.white, for: .normal)
        Button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20.0)
        contentView.addSubview(Button)
        scrollView.delaysContentTouches = false
        setButtonContrainsts()
    }
    
    func setButtonContrainsts() {
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        Button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
