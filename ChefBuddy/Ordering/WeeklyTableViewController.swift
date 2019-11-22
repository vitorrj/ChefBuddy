//
//  WeeklyTableViewController.swift
//  ChefBuddy
//
//  Created by Vitor Jacinto on 19/11/2019.
//  Copyright © 2019 Foodies. All rights reserved.
//

import UIKit

class WeeklyTableViewController: UITableViewController {
    
    
    struct ingredientInfo  {
        var location: String
        var ingredientName: [String]
    }
    
//    ARRAY OF INGREDIENTS
//    var ingredient: [ingredientInfo] = [
//        ingredientInfo(location: "Fridge", ingredientName: ["🧀 Cheese", "🍅 Tomatoes"]),
//        ingredientInfo(location: "Pantry", ingredientName: ["🥦 Basil", "🥐 Flour"])
//    ]
    var ingredient: [ingredientInfo] = [
        ingredientInfo(location: "Fridge",
                       ingredientName: ProductDAO.instance.getProductName())
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return ingredient.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredient[section].ingredientName.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientList", for: indexPath)
        
        cell.textLabel?.text = ingredient[indexPath.section].ingredientName [indexPath.row]

        return cell
    }  

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ingredient[section].location
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

//ok
