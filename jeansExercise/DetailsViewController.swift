//
//  DetailsViewController.swift
//  jeansExercise
//
//  Created by Yessine Kebir on 12/06/18.
//  Copyright © 2018 YSN. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var product : Jeans?
    var tempPrice : Double = 0.00
    var tempDiscount : Double = 0.00
    @IBOutlet weak var nameOfProduct: UILabel!
    @IBOutlet weak var codeOfProduct: UILabel!
    @IBOutlet weak var priceOfProduct: UILabel!
    @IBOutlet weak var discountOfProduct: UILabel!
    @IBOutlet weak var discountedPrice: UILabel!
    
    
    
    func varBinding(){
        if let item = self.product {
            self.nameOfProduct.text = item.name
            self.codeOfProduct.text = item.code
            self.priceOfProduct.text = String(item.price)
            self.tempPrice = item.price
            if let sale = item.sale {
                self.discountOfProduct.text = String(sale)
                self.tempDiscount = sale
            }
        }
        
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func showDiscounted(_ sender: Any) {
        if self.tempDiscount == 0 {
            self.discountedPrice.text = "Non esiste alcun sconto per questo capo"
        }
        else {
            self.discountedPrice.text = String((tempPrice - (tempPrice*tempDiscount)/100))
        }
    }
    
    @IBOutlet weak var buyBtn: UIButton!
    
    func hideBuy(){
        if self.product?.isBuyed == true {
            self.buyBtn.isEnabled = false
            self.buyBtn.backgroundColor = UIColor.red
        }
    }
    
    @IBAction func buyProduct(_ sender: Any) {
        self.product?.isBuyed = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideBuy()
        self.varBinding()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
