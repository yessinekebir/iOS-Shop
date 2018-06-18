//
//  Jeans.swift
//  jeansExercise
//
//  Created by Yessine Kebir on 12/06/18.
//  Copyright © 2018 YSN. All rights reserved.
//

import UIKit

class Jeans: NSObject {
    var name   : String
    var code   : String
    var price  : Double
    var sale   : Double?
    var isBuyed : Bool = false
    
    init(name : String ,code : String , price : Double, sale : Double?, isBuyed : Bool){
        self.name = name
        self.code = code
        self.price = price
        self.isBuyed = isBuyed
        
        if let isSale = sale {
            self.sale = isSale
        }
    }
    
}
