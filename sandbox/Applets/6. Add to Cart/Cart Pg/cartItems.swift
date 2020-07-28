//
//  cartItems.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-13.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

struct cartList: Codable {
    var productName : String
    var productPrice : String
    var qty: Int
}


struct cartItems {
    static var productList: [cartList] = []
    static var listofProducts : [String] = []
    static var cartCountHidden = true
    static var totalCount = 0
    static var productQty: [Int] = []
    static var productPrice: [String] = []
    
    static func findTotalCount(){
        totalCount = 0
        for i in productList{
            totalCount += i.qty
        }
    }
}

