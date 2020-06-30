//
//  ShopViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-26.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//


import UIKit

class ShopViewController: UIViewController {
   
    // MARK: Functions

    
    @IBOutlet weak var items: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //createButton()
        items.delegate = self
        items.dataSource = self
        //setButtonContrainsts()

        // Do any additional setup after loading the view.
    }
}


extension ShopViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("you tapped me")
    }
}

extension ShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        
        return cell
    }
    
}

/*
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

 

