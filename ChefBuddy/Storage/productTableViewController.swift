//
//  productTableViewController.swift
//  ChefBuddy
//
//  Created by Valerio Volpe on 21/11/2019.
//  Copyright © 2019 Foodies. All rights reserved.
//

import UIKit

class productTableViewController: UITableViewController {
    
    var items : [Product] = []
    var temp = ProductDAO.instance.getProducts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // print("pass: ", pass)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        for prod in temp {
            if (prod.location == pass) {
                items.append(prod)
            }
        }
    }


    var pass : String?


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let productInfoViewController = segue.destination as? productInfoViewController,
            let index = tableView.indexPathForSelectedRow?.row
            else {
                return
            }
        productInfoViewController.item = items[index]
      //  print("done " , items[index].name! , index)
        
    }



    

}
