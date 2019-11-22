//
//  productInfoViewController.swift
//  ChefBuddy
//
//  Created by Valerio Volpe on 21/11/2019.
//  Copyright © 2019 Foodies. All rights reserved.
//

import UIKit

class productInfoViewController: UIViewController {
    
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!

    var item: Product!
    var usr: Int = 0                   // userChoice
    var temp: Int = 0
//  var remain = self.item.remain      //  left

    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = item.name
        
        let qlabelText:String = String(item.remain) + " " + item.infoWeight!
        quantityLabel.text = qlabelText

        let ilabelText:String = "To be kept around " + "n" + " °C \n" + "Expiry date: " + "dd/mm/yyyy"
        infoLabel.text = ilabelText

        //temp = remain
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func Step(_ sender: UIStepper) {
        
        temp = Int(item.remain + Int64(sender.value))
        //remain = temp+Int(sender.value)
        quantityLabel.text = String(temp) + " " + item.infoWeight!
        usr = Int(sender.value)
        item.remain = Int64(temp)
       // print("sender val: ", usr, "temp: ", temp)
        ProductDAO.instance.updateProduct(pid: item.idProd, newProduct: item)
        sender.value = 0
    }
    

    
    @IBAction func deleteProduct(_ sender: UIButton) {
        ProductDAO.instance.deleteProduct(pid: item.idProd)
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    /*
     //
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
