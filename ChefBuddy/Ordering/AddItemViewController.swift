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
   // @IBOutlet weak var quick: UISwitch!
    //          ----------------------
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addProd(_ sender: UIButton) {
        
        let pname: String? = Name.text
        let ploc: String? = location.text
        let pidSup: Int64! = Int64(idStorage.text!)
        let pidSto: Int64! = Int64(idSupplier.text!)
        let pimage: String? = image.text
        let pinfoWeight: String? = infoWeight.text
        //var pquick: Bool! = quick.isOn
        var insert: String?
                
        insert = ProductDAO.instance.addProduct(pname: pname, plocation: ploc, pidStor: pidSto, pbought: 0, pidSup: pidSup, pimage: pimage, pinfoWeight: pinfoWeight, premain: 0, pquick: false)
        
        if (insert == "Insert done") {
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)        }
        else {
            print("Error insert chek all forms")
        }
        
    }
    
    @IBAction func ShowProduct(_ sender: UIButton) {
        var prods:[Product]
        //ar name= p
        prods = ProductDAO.instance.getProducts()
        
        for item in prods {
            print(item.name!)
        }
    }
    @IBAction func back(_ sender: UIButton) {
        // _ = navigationController?.popViewController(animated: true)
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)

    }
    
}
