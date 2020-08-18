//
//  CheckoutInfo.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-09.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import Foundation

struct CheckoutInfo {
    
    // Personal Info
    static var email: String = ""
    static var phoneNumber: String = ""
    
    // Shipping Info
    static var shipFirstName: String = ""
    static var shipLastName: String = ""
    static var shipAddress1: String = ""
    static var shipAddress2: String? = ""
    static var shipCity: String = ""
    static var shipState: String = ""
    static var shipZipCode: String = ""
    
    // Payment Info
    static var cardholderName = ""
    static var cardNumber = ""
    static var monthYear = ""
    static var cvvNum = ""
    
    // Billing Info
    static var billFirstName: String = ""
    static var billLastName: String = ""
    static var billAddress1: String = ""
    static var billAddress2: String? = ""
    static var billCity: String = ""
    static var billState: String = ""
    static var billZipCode: String = ""
}
