//
//  AddItemViewController.swift
//  ChefBuddy
//
//  Created by Vitor Jacinto on 18/11/2019.
//  Copyright © 2019 Foodies. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    //          --  ADD PRDOCUCT  --
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var idStorage: UITextField!
    @IBOutlet weak var idSupplier: UITextField!
    @IBOutlet weak var image: UITextField!
    @IBOutlet weak var infoWeight: UITextField!
    @IBOutlet weak var quick: UISwitch!
    //          ----------------------
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addProd(_ sender: UIButton) {
        
        var pname: String? = Name.text
        var ploc: String? = location.text
        var pidSup: Int64! = Int64(idStorage.text!)
        var pidSto: Int64! = Int64(idSupplier.text!)
        var pimage: String? = image.text
        var pinfoWeight: String? = infoWeight.text
        var pquick: Bool! = quick.isOn

        ProductDAO.instance.addProduct(pname: pname, plocation: ploc, pidStor: pidSto, pbought: 0, pidSup: pidSup, pimage: pimage, pinfoWeight: pinfoWeight, premain: 0, pquick: pquick)
        
        
    }
    
    @IBAction func ShowProduct(_ sender: UIButton) {
        var prods:[Product]
        //ar name= p
        prods = ProductDAO.instance.getProducts()
        
        for item in prods {
            print(item.name)
        }
    }
    
}
