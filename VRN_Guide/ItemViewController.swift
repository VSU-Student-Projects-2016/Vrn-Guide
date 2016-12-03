//
//  ItemViewController.swift
//  VRN_Guide
//
//  Created by Надежда on 15.10.16.
//  Copyright © 2016 PTeam. All rights reserved.
//

import UIKit

class ItemViewController: UITableViewController {

    @IBOutlet var ItemTable: UITableView!
    
    var items=[Item]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //load sample data
        loadSamples()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadSamples()
    {
        let photo1 = UIImage(named: "cat1")
        let item1 = Item.init(name: "this is a cat", context: "He is cute", image: photo1!)
        
        let photo2 = UIImage(named: "cat2")
        let item2 = Item.init(name: "this is a cat", context: "He is cute", image: photo2!)
        
        let photo3 = UIImage(named: "cat3")
        let item3 = Item.init(name: "this is a cat", context: "He is cute", image: photo3!)
        
        
        items += [item1, item2, item3]
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ItemTableViewCell {
        
        let cellIdentifier = "ItemTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell
    
        cell.ItemName.text=items[indexPath.row].name
        cell.ItemContext.text=items[indexPath.row].context
        cell.ItemPhoto.image=items[indexPath.row].image
    
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
