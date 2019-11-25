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
    

    var ingredient: [ingredientInfo] = [
        ingredientInfo(location: "Fridge",
                       ingredientName: ProductDAO.instance.getProductName(), product: ProductDAO.instance.getProducts())
    ]
    


    override func viewDidLoad() {
        super.viewDidLoad()
//        let login = logViewController()
//        self.navigationController?.pushViewController(login, animated: true)

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "logView")
//        resultViewController.presentingViewController = resultViewController.star
        resultViewController.navigationItem.hidesBackButton = true
//        resultViewController.tabBarItem = hidd
        self.navigationController?.pushViewController(resultViewController, animated: true)
//        self.tabBarController?.tabBar.hidden = true

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
        cell.textLabel?.text = ingredient[indexPath.section].ingredientName[indexPath.row]
        cell.textLabel?.text = ingredient[indexPath.section].ingredientName[indexPath.row]
        
        return cell
    }  

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ingredient[section].location
    }

            func screenShotMethod() {
                //Create the UIImage
                UIGraphicsBeginImageContext(view.frame.size)
                view.layer.render(in: (UIGraphicsGetCurrentContext()!))
                let image = UIGraphicsGetImageFromCurrentImageContext()!
                UIGraphicsEndImageContext()
                //Save it to the camera roll
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                
                print ("screened")
            }
    
            
    
    @IBOutlet weak var done_button: UIBarButtonItem!
    
    @IBAction func done(_ sender: Any) {
        screenShotMethod()
        let alertController = UIAlertController(title: "Order Done!", message:
               "Your order has been saved and updated", preferredStyle: .alert)
           alertController.addAction(UIAlertAction(title: "Return", style: .default))

           self.present(alertController, animated: true, completion: nil)
    }
    
}


