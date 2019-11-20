//
//  suppliersTableViewController.swift
//  ChefBuddy
//
//  Created by Valerio Volpe on 19/11/2019.
//  Copyright © 2019 Foodies. All rights reserved.
//

import UIKit

class suppliersTableViewController: UITableViewController {

    var suppliersNames:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
            
//        SupplierDAO.instance.addSupplier(sname: "Ciruzzo", semail: "ant@on.io", saddress: "Via Sad")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    struct Letter {
            var X: String
            var name: [String]
        }
        var alphabetSort: [Letter] = [
            Letter(X: "A",
            name: SupplierDAO.instance.getSuppliersName(letter: "A")),
            Letter(X: "B",
            name: SupplierDAO.instance.getSuppliersName(letter: "B")),
            Letter(X: "C",
            name: SupplierDAO.instance.getSuppliersName(letter: "C")),
            Letter(X: "D",
            name: SupplierDAO.instance.getSuppliersName(letter: "D")),
            Letter(X: "E",
            name: SupplierDAO.instance.getSuppliersName(letter: "E")),
            Letter(X: "F",
            name: SupplierDAO.instance.getSuppliersName(letter: "F")),
            Letter(X: "G",
            name: SupplierDAO.instance.getSuppliersName(letter: "G")),
            Letter(X: "H",
            name: SupplierDAO.instance.getSuppliersName(letter: "H")),
            Letter(X: "I",
            name: SupplierDAO.instance.getSuppliersName(letter: "I")),
            Letter(X: "J",
            name: SupplierDAO.instance.getSuppliersName(letter: "J")),
            Letter(X: "K",
            name: SupplierDAO.instance.getSuppliersName(letter: "K")),
            Letter(X: "L",
            name: SupplierDAO.instance.getSuppliersName(letter: "L")),
            Letter(X: "M",
            name: SupplierDAO.instance.getSuppliersName(letter: "M")),
            Letter(X: "N",
            name: SupplierDAO.instance.getSuppliersName(letter: "N")),
            Letter(X: "O",
            name: SupplierDAO.instance.getSuppliersName(letter: "O")),
            Letter(X: "P",
            name: SupplierDAO.instance.getSuppliersName(letter: "P")),
            Letter(X: "Q",
            name: SupplierDAO.instance.getSuppliersName(letter: "Q")),
            Letter(X: "R",
            name: SupplierDAO.instance.getSuppliersName(letter: "R")),
            Letter(X: "S",
            name: SupplierDAO.instance.getSuppliersName(letter: "S")),
            Letter(X: "T",
            name: SupplierDAO.instance.getSuppliersName(letter: "T")),
            Letter(X: "U",
            name: SupplierDAO.instance.getSuppliersName(letter: "U")),
            Letter(X: "V",
            name: SupplierDAO.instance.getSuppliersName(letter: "V")),
            Letter(X: "W",
            name: SupplierDAO.instance.getSuppliersName(letter: "W")),
            Letter(X: "X",
            name: SupplierDAO.instance.getSuppliersName(letter: "X")),
            Letter(X: "Y",
            name: SupplierDAO.instance.getSuppliersName(letter: "Y")),
            Letter(X: "Z",
            name: SupplierDAO.instance.getSuppliersName(letter: "Z"))
            
        ]


        override func numberOfSections(in tableView: UITableView) -> Int {
            return alphabetSort.count
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return alphabetSort[section].name.count
        }


        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "suppliersCell", for: indexPath)

            cell.textLabel?.text = alphabetSort[indexPath.section].name[indexPath.row]

            return cell
        }
    
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return alphabetSort[section].X
        }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
            print("deleted")
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
