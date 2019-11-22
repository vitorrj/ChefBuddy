//
//  storageTableViewController.swift
//  ChefBuddy
//
//  Created by Valerio Volpe on 19/11/2019.
//  Copyright © 2019 Foodies. All rights reserved.
//

import UIKit

class storageTableViewController: UITableViewController {
    
    var share: String?
    var temps: [Location] = []
    
    struct Category {
        var name: String
        var items: [String]
        var idLoc: [Int64]
    }
    
    @IBOutlet var tv: UITableView!
    var storageLocations: [Category] = [
        Category(name: "Locations", items: LocationDAO.instance.getLocationsName(), idLoc: [])]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tv.delegate = self
        tv.dataSource = self

//       LocationDAO.instance.addLocation(lnamLoc: "Fridge 1")
//        LocationDAO.instance.addLocation(lnamLoc: "Fridge 2")
//        LocationDAO.instance.addLocation(lnamLoc: "Fridge 3")
//        ProductDAO.instance.addProduct(pname: "Tomato", plocation: "Fridge", pidStor: 1, pbought: 5, pidSup: 1, pimage: "", pinfoWeight: "kg", premain: 2, pquick: false)
        
        temps = LocationDAO.instance.getLocations()
        for it in temps {
            storageLocations[0].idLoc.append(it.idLoc)
        }
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        return storageLocations.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storageLocations[section].items.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storageCell", for: indexPath)

        cell.textLabel?.text = storageLocations[indexPath.section].items[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return storageLocations[section].name
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let productTableViewController = segue.destination as? productTableViewController,
            let index = tableView.indexPathForSelectedRow?.row
            else {
                return
        }
        productTableViewController.pass = storageLocations[0].items[index]
        print("done " , storageLocations[0].idLoc[index] , index)
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("deleted")
        LocationDAO.instance.deleteLocation(lid: Int64(storageLocations[indexPath.section].idLoc[indexPath.row]))

        self.tv.reloadData()
        tv.reloadData()
        tableView.reloadData()
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
