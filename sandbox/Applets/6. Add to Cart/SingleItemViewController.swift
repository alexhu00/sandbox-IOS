//
//  SingleItemViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-10.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

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
        //contentView.bottomAnchor.constraint(equalTo: productDescription.bottomAnchor, constant: -100).isActive = true
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
        // Check if item is already in cart
        if !cartItems.listofProducts.contains(singleItemName.text!) {
            cartItems.productList.append(cartList(productName: singleItemName.text!, productImage: singleItemImage.image!, productPrice: singleItemPrice.text!, qty: 1))
            cartItems.listofProducts.append(singleItemName.text!)
        }
            
        // If item is already in cart, then add 1 to its' qty
        else {
            let itemIndex = cartItems.listofProducts.firstIndex(of: singleItemName.text!)!
            cartItems.productList[itemIndex].qty += 1
        }
        /*
        var items = 0
        for i in cartItems.productList{
            items += i.qty
        }
 */
        cartItems.findTotalCount()
        
        //cartItems.totalCount = items
        if cartItems.totalCount == 1 {
            cartItems.cartCountHidden = false
            cartCountNum.text = String(cartItems.totalCount)
            UIView.transition(with: cartCount, duration: 0.4,
                options: .transitionFlipFromLeft,
                animations: {
                    self.cartCount.isHidden = cartItems.cartCountHidden})
        }
        else{
            cartCountNum.text = String(cartItems.totalCount)
            //cartCountNum.isHidden = true
            //UILabel.transition(with: cartCountNum, duration: 1.0, options: .transitionFlipFromLeft, animations: {
            //self.cartCountNum.isHidden = false}, completion: nil)
            
            self.cartCount.isHidden = !cartItems.cartCountHidden
            UIView.transition(with: cartCount, duration: 0.4, options: .transitionFlipFromLeft, animations: {
                self.cartCount.isHidden = cartItems.cartCountHidden
            }, completion: nil)
        }
        print(cartItems.totalCount)

        //cartItems.productList.append(product(productName: singleItemName.text!, productImage: singleItemImage.image!, productPrice: singleItemPrice.text!, description: ""))
        print(cartItems.productList.count)
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
        //Button.centerYAnchor.constraint(equalTo: self.agree.bottomAnchor, constant: 50).isActive = true
    }
}

/*
 
 let contentRect: CGRect = scrollView.subviews.reduce(into: .zero) { rect, view in rect = rect.union(view.frame)}
 
 scrollView.contentSize = contentRect.size
 
 scrollView.translatesAutoresizingMaskIntoConstraints = false

 scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
 scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
 scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
 
 
 contentView.translatesAutoresizingMaskIntoConstraints = false

 contentView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
 contentView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
 contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
 
 //contentView.bottomAnchor.CON

 
 
 

 
 */
