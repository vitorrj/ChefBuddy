//
//  productInfoViewController.swift
//  ChefBuddy
//
//  Created by Valerio Volpe on 21/11/2019.
//  Copyright © 2019 Foodies. All rights reserved.
//

import UIKit

class productInfoViewController: UIViewController {

    var qt: Int = 3 //left
    var usr: Int = 0 //userChoice
    var temp: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let qlabelText:String = String(qt) + " Kg"
        quantityLabel.text = qlabelText

        let ilabelText:String = "To be kept around " + "n" + " °C \n" + "Expiry date: " + "dd/mm/yyyy"
        infoLabel.text = ilabelText

        temp = qt
        
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!

       
       @IBOutlet weak var stepper: UIStepper!
       @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        qt = temp+Int(sender.value)
        quantityLabel.text = String(qt) + " Kg"
        usr = Int(sender.value)
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
