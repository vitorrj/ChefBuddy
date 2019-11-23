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
        var product: [Product] = []
    }
    
//    ARRAY OF INGREDIENTS
//    var ingredient: [ingredientInfo] = [
//        ingredientInfo(location: "Fridge", ingredientName: ["🧀 Cheese", "🍅 Tomatoes"]),
//        ingredientInfo(location: "Pantry", ingredientName: ["🥦 Basil", "🥐 Flour"])
//    ]
    var ingredient: [ingredientInfo] = [
        ingredientInfo(location: "Fridge",
                       ingredientName: ProductDAO.instance.getProductName(), product: ProductDAO.instance.getProducts())
    ]
    


    override func viewDidLoad() {
        super.viewDidLoad()

    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return ingredient.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredient[section].ingredientName.count
    }


    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientList", for: indexPath) 
//        cell.item! = ingredient[indexPath.section].product[indexPath.row]
//        cell.textLabel?.text = ingredient[indexPath.section].ingredientName[indexPath.row]
//        cell.textLabel?.text = ingredient[indexPath.section].ingredientName[indexPath.row]
        
        return cell
    }  

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ingredient[section].location
    }


}


