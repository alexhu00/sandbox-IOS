//
//  ShopViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-26.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//


import UIKit

class ShopViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ItemsCollectionViewCell
        
        cell!.itemImage.image = #imageLiteral(resourceName: "a11y (1)")
        cell!.itemTitle.text = "A11y Bot"
        print(cell!.itemTitle.text)
        cell!.itemPrice.text = "$3.00"
        return cell!
    }
    
   
    // MARK: Functions

    @IBOutlet weak var items: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //createButton()
        items.delegate = self
        items.dataSource = self
        //setButtonContrainsts()
    }

    

}



/*
 func numberOfSections(in collectionView: UICollectionView) -> Int {
     1
 }
 
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return 1
 }
 
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ItemsCollectionViewCell else {
         fatalError("The dequeued cell is not an instance of MealTableViewCell.")}
     
     cell.itemImage.image = #imageLiteral(resourceName: "a11y (1)")
     cell.itemTitle.text = "A11y Bot"
     cell.itemPrice.text = "$3.00"
     return cell
 }
 
 
 
 extension ShopViewController: UICollectionViewDataSource {

     
 }
 
 extension ShopViewController: UICollectionViewDelegate {
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         collectionView.deselectItem(at: indexPath, animated: true)
         print("you tapped me")
     }
 }
 
 
extension ShopViewController: UICollectionViewFlowLayout{
    
}
*/

//UICollectionViewDelegate, UICollectionViewDataSource

/*
    func createButton(){
        button.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        button.layer.cornerRadius = 25.0
        view.addSubview(button)
    }
    
    func setButtonContrainsts() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 580).isActive = true
    }
    
*/

 

