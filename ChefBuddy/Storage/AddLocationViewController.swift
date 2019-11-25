//
//  AddLocationViewController.swift
//  ChefBuddy
//
//  Created by Marco Amorosi on 22/11/2019.
//  Copyright © 2019 Foodies. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var lname: UITextField!
    


    @IBAction func addLocation(_ sender: UIButton) {
        let name: String? = lname.text
        var insert: String?
        
        insert = LocationDAO.instance.addLocation(lnamLoc: name)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}
