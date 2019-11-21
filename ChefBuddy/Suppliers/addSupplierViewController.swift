//
//  addSupplierViewController.swift
//  ChefBuddy
//
//  Created by Valerio Volpe on 20/11/2019.
//  Copyright © 2019 Foodies. All rights reserved.
//

import UIKit

class addSupplierViewController: UIViewController {


    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var address: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addProduct(_ sender: UIButton) {
        let sname: String? = name.text
        let semail: String? = email.text
        let saddress: String? = address.text
        var insert: String?
        
        insert = SupplierDAO.instance.addSupplier(sname: sname, semail: semail, saddress: saddress)
        
        if (insert == "Insert done") {
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)        }
        else {
            print("Error insert chek all forms")
        }
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
