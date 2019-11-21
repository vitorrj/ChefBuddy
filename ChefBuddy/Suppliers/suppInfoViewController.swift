//
//  suppInfoViewController.swift
//  ChefBuddy
//
//  Created by Valerio Volpe on 21/11/2019.
//  Copyright © 2019 Foodies. All rights reserved.
//

import UIKit

class suppInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        // Do any additional setup after loading the view.
        
        let plabelText:String = "Phone: \n" + "333 45 678"
        phoneLabel.text = plabelText
        let mlabelText:String = "Mail: \n" + "default@mail.com"
        mailLabel.text = mlabelText
    }
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
