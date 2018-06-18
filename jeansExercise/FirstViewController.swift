//
//  FirstViewController.swift
//  jeansExercise
//
//  Created by Yessine Kebir on 12/06/18.
//  Copyright © 2018 YSN. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    //Views
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    // Labels
    // 1st View
    @IBOutlet weak var nameFirstProduct: UILabel!
    @IBOutlet weak var codeFirstProduct: UILabel!
    @IBOutlet weak var priceFirstProduct: UILabel!
    @IBOutlet weak var saleFirstProduct: UILabel!
    
    // 2nd View
    @IBOutlet weak var nameSecondProduct: UILabel!
    @IBOutlet weak var codeSecondProduct: UILabel!
    @IBOutlet weak var priceSecondProduct: UILabel!
    @IBOutlet weak var saleSecondProduct: UILabel!
    
    // 3rd View
    @IBOutlet weak var nameThirdProduct: UILabel!
    @IBOutlet weak var codeThirdProduct: UILabel!
    @IBOutlet weak var priceThirdProduct: UILabel!
    @IBOutlet weak var saleThirdProduct: UILabel!
    
    // COUNTER BOUGHT PRODUCTS
    @IBOutlet weak var boughtProduct: UILabel!
    
    var index : Int?
    var jeans : [Jeans] = []
    var manager : Seller? = nil
    
    @IBAction func firstAction(_ sender: Any) {
        self.index = 0
        self.performSegue(withIdentifier: "goToDetailsVC", sender: self)
    }
    
    @IBAction func secondAction(_ sender: Any) {
        self.index = 1
        self.performSegue(withIdentifier: "goToDetailsVC", sender: self)
    }
    
    
    @IBAction func thirtyAction(_ sender: Any) {
        self.index = 2
        self.performSegue(withIdentifier: "goToDetailsVC", sender: self)
    }
    
    func showBought(){
        var bought : Int = 0
        if let isManager = self.manager{
            for item in isManager.dataSource{
                if item.isBuyed == true {
                    bought+=1
                    self.boughtProduct.text = String(bought)
                }
            }
        }
    }
    
    
    
    // SET LABELS
    
    func setLabelsView1(){
        if let manager = self.manager {
            self.nameFirstProduct.text = manager.dataSource[0].name
            self.codeFirstProduct.text = manager.dataSource[0].code
            self.priceFirstProduct.text = String(manager.dataSource[0].price)
            if let sale = manager.dataSource[0].sale{
                self.saleFirstProduct.text = String(sale)
            }
        }
        
    }
    func setLabelsView2(){
        if let manager = self.manager {
            self.nameSecondProduct.text = manager.dataSource[1].name
            self.codeSecondProduct.text = manager.dataSource[1].code
            self.priceSecondProduct.text = String(manager.dataSource[1].price)
            if let sale = manager.dataSource[1].sale{
                self.saleSecondProduct.text = String(sale)
            }
        }
    }
    func setLabelsView3(){
        if let manager = self.manager {
            self.nameThirdProduct.text = manager.dataSource[2].name
            self.codeThirdProduct.text = manager.dataSource[2].code
            self.priceThirdProduct.text = String(manager.dataSource[2].price)
            if let sale = manager.dataSource[2].sale{
                self.saleThirdProduct.text = String(sale)
            }
        }
    }
    
    
    func setLabels(){
        self.setLabelsView1()
        self.setLabelsView2()
        self.setLabelsView3()
    }
    
    
    
    
    // Functions
    
    func initManager(){
        self.manager = Seller.init(shopKeeperName: "Negoziante", dataSource: self.jeans)
        self.manager?.populateDataSource()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.showBought()

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initManager()
        self.setLabels()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailsVC" {
            print("vado su DetailsViewController")
            
            let destinationVC = segue.destination as! DetailsViewController
            
            if let myIndex = self.index {
                self.index = myIndex
                let item = manager?.dataSource[myIndex]
                destinationVC.product = item
            }
            
        }
    }
    
}
