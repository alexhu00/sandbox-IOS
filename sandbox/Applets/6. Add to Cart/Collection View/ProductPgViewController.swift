//
//  ProductPgViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-10.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

struct product {
    var productName : String
    var productImage : UIImage
    var productPrice : String
    var description: String
}

class ProductPgViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var productList: [product] = [
        product(productName: "A11y Bot", productImage: #imageLiteral(resourceName: "a11y (1)"), productPrice: "$2.00", description: "A11y is awesome! Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and "),
        
        product(productName: "Customer Bot", productImage: #imageLiteral(resourceName: "customer-bot (1)"), productPrice: "$3.00", description: "Customers are always number 1! Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable"),
        
        product(productName: "Bug Bot", productImage: #imageLiteral(resourceName: "bug-bot (1)"), productPrice: "$4.00", description: "Bug suck boo. Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durableWoven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable "),
        
        product(productName: "Success Bot", productImage: #imageLiteral(resourceName: "bot-thank-you"), productPrice: "$5.00", description: "Success is amazing wooho! Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved"),
        
        product(productName: "Test Bot", productImage: #imageLiteral(resourceName: "infrastructure-bot (1)"), productPrice: "$6.00", description: "Testing, testing, 1, 2, 3! Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable"),
        
        product(productName: "Mesmer Bot", productImage: #imageLiteral(resourceName: "Mesmer Robot Emoji customer 2"), productPrice: "$7.00", description: "Go Mesmer! Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. ")
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ProductCollectionViewCell
        
        cell.itemImage.image = self.productList[indexPath.row].productImage
        //cell.itemImage.image = #imageLiteral(resourceName: "bug-bot (1)")
        cell.itemName.text = self.productList[indexPath.row].productName
        cell.itemPrice.text = self.productList[indexPath.row].productPrice
        
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.backgroundColor = UIColor.white.cgColor
        cell.contentView.layer.borderColor = UIColor.white.cgColor
        //cell.contentView.layer.masksToBounds = true
        //cell.layer.borderColor = UIColor.red.cgColor
        
        cell.backgroundColor = UIColor.clear
        //cell.layer.shadowColor = UIColor.gray.cgColor
        //cell.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        //cell.layer.shadowOpacity = 0.7

        //cell.layer.shadowRadius = 5.0
        //cell.layer.shouldRasterize = true
        cell.layer.masksToBounds = false
        cell.clipsToBounds = false
        //cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        //cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        cell.contentView.isUserInteractionEnabled = false
        return cell
    }
    
    
    var index: Int = 1

    /*
    @objc func tap(_ sender: UITapGestureRecognizer) {

        let location = sender.location(in: self.items)
        let indexPath = self.items.indexPathForItem(at: location)
        //index = indexPath?.row as! Int
        performSegue(withIdentifier: "viewItem", sender: self)

       if let index = indexPath {
          print("Got clicked on index: \(index)!")
       }
    }
    
    */


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
        //collectionView.index
        
        performSegue(withIdentifier: "viewItem", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewItem" {
            let destinationVC = segue.destination as! SingleItemViewController
            //destinationVC.image = productList[index].productImage
            destinationVC.name = self.productList[index].productName
            destinationVC.price = self.productList[index].productPrice
            destinationVC.productText = self.productList[index].description
            switch productList[index].productName {
            case "A11y Bot":
                destinationVC.image = #imageLiteral(resourceName: "a11y (1)")
            case "Customer Bot":
                destinationVC.image = #imageLiteral(resourceName: "customer-bot (1)")
            case "Bug Bot":
                destinationVC.image = #imageLiteral(resourceName: "bug-bot (1)")
            case "Success Bot":
                destinationVC.image = #imageLiteral(resourceName: "bot-thank-you")
            case "Test Bot":
                destinationVC.image = #imageLiteral(resourceName: "infrastructure-bot (1)")
            case "Mesmer Bot":
                destinationVC.image = #imageLiteral(resourceName: "Mesmer Robot Emoji customer 2")
            default:
                print("Error")
            }
        }
    }
  
    @IBAction func viewCart(_ sender: UIButton) {
        performSegue(withIdentifier: "viewCartfromHomepg", sender: self)
    }
    
    @IBOutlet weak var cartCount: UIView!
    
    @IBOutlet weak var cartCountNum: UILabel!
    
    @IBOutlet weak var items: UICollectionView!
    
    let defaults = UserDefaults.standard
    
    var visualDiffs = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items.delegate = self
        items.dataSource = self
        self.cartCount.isHidden = false
        //self.cartCount.isHidden = cartItems.cartCountHidden
        self.cartCountNum.text = String(cartItems.totalCount)
        
        visualDiffs = settings.visualDiffsOn
        if (visualDiffs){
            self.productList[3].productImage = #imageLiteral(resourceName: "bot-hooray")
        }
        else{
            self.productList[3].productImage = #imageLiteral(resourceName: "bot-thank-you")
        }
    
        print(!defaults.bool(forKey: keys.cartEdited))
        if (!defaults.bool(forKey: keys.cartEdited)){
            cartItems.listofProducts = []
            cartItems.totalCount = 0
            cartItems.productList = []
            cartItems.productPrice = []
            cartItems.productQty = []
            print(defaults.integer(forKey: keys.totalCount))
        }
        
        else{
            print("Edited was changed and else statements were run!!!")
            cartItems.listofProducts = defaults.stringArray(forKey: keys.listofProducts)!
            cartItems.totalCount = defaults.integer(forKey: keys.totalCount)
            cartItems.productPrice = defaults.stringArray(forKey: keys.price)!
            cartItems.productQty = defaults.array(forKey:keys.productQty)! as! [Int]
            //cartItems.productList = defaults.object(forKey: keys.productList) as! [cartList]
         
            cartItems.productList = []
            
            for i in 0...(cartItems.listofProducts.count - 1){

                print( "This is the qty from the home page!  \(defaults.array(forKey:keys.productQty)![i] as! Int)")
                let a = cartList(
                    productName: defaults.stringArray(forKey: keys.listofProducts)![i],
                    productPrice: defaults.stringArray(forKey: keys.price)![i],
                    qty: defaults.array(forKey:keys.productQty)![i] as! Int
                )
                cartItems.productList.append(a)
            }
        
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.cartCount.isHidden = cartItems.cartCountHidden
        self.cartCount.isHidden = false
        self.cartCountNum.text = String(cartItems.totalCount)
        
        
        // Updating defaults
        
        defaults.set(cartItems.totalCount, forKey: keys.totalCount)
        defaults.set(cartItems.listofProducts, forKey: keys.listofProducts)
        defaults.set(cartItems.productQty, forKey: keys.productQty)
        defaults.set(cartItems.productPrice, forKey: keys.price)
        
        if (defaults.bool(forKey: keys.cartEdited)) {
            // (cartItems.listofProducts.count - 1) > 0
            cartItems.productList = []
            for i in 0...(cartItems.listofProducts.count - 1){
            print("View Appeared thing was run!!!")
                print( "This is the qty from the home page!  \(defaults.array(forKey:keys.productQty)![i] as! Int)")
                let a = cartList(
                    productName: defaults.stringArray(forKey: keys.listofProducts)![i],
                    productPrice: defaults.stringArray(forKey: keys.price)![i],
                    qty: defaults.array(forKey:keys.productQty)![i] as! Int
                )
                cartItems.productList.append(a)
            }
            for i in 0...(cartItems.listofProducts.count - 1){
                print("CART INFORMATION")
                print("\(cartItems.productList[i].productName)")
                print("\(cartItems.productList[i].qty)")
                print("\(cartItems.productList[i].productPrice)")
            }
        }

    }
}

/*
"Inspired by rattan furniture popular in the 50s and 60s, this modernized chair is handcrafted using traditional weaving techniques with new and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable Woven from a more durable, and improved materials. Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable  Woven from a more durable, and improved materials. Woven from a more durable, Woven from a more durable, and improved materials. Woven from a more durable"
 */
