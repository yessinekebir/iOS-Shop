//
//  Seller.swift
//  jeansExercise
//
//  Created by Yessine Kebir on 12/06/18.
//  Copyright © 2018 YSN. All rights reserved.
//

import UIKit

class Seller: NSObject{
    var shopKeeperName : String
    var dataSource : [Jeans]
    
    init(shopKeeperName: String, dataSource : [Jeans]){
        self.shopKeeperName = shopKeeperName
        self.dataSource = dataSource
    }
    
    func populateDataSource(){
        let jeansDiesel : Jeans = Jeans.init(name: "Jeans Diesel", code: "001", price: 110.00, sale: 10.00,isBuyed: false)
        let jeansGas : Jeans =  Jeans.init(name: "Jeans Gas", code: "003", price: 80.00, sale: nil,isBuyed: false)
        let jeansLevis : Jeans = Jeans.init(name: "Jeans Levis", code: "002", price: 90.00, sale: 15.00,isBuyed: false)
        
        self.dataSource = [jeansDiesel, jeansGas, jeansLevis]
    }
}
