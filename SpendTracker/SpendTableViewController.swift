//
//  SpendTableViewController.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/16/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class SpendTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var spends = [Spend]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spends.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "SpendTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SpendTableViewCell

        let spend = spends[indexPath.row]
        
        cell.detailLabel.text = spend.item + " : $" + String(spend.price)
        cell.photoImageView.image = spend.image
        if spend.needed{
            cell.itemStatusLabel.text = "Needed"
        }
        else{
            cell.itemStatusLabel.text = "Not Needed"
        }
        

        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Delete the row from the data source
            spends.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
         
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail"{
            
            //let a variable be equal to the segue's destination ( viewcontroller)
            let spendDetailViewController = segue.destinationViewController as! ViewController
            
            //let a variable be equal to segue's sender ( spendTableViewCell)
            if let selectedSpendCell = sender as? SpendTableViewCell {
                
                //get the indexpath from the cell
                let indexPath = tableView.indexPathForCell(selectedSpendCell)!
                
                //get the selected spend from the indexPath
                let selectedSpend = spends[indexPath.row]
                
                //let the spend from view controller be equal to the selected spend
                spendDetailViewController.spend = selectedSpend
            
            }
        }
        else if segue.identifier == "AddItem"{
            print("Adding new meal") //no action required
        }
        
    }
 
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? ViewController, spend = sourceViewController.spend {
            
            if let selectedPath = tableView.indexPathForSelectedRow{
                spends[selectedPath.row] = spend
                tableView.reloadRowsAtIndexPaths([selectedPath], withRowAnimation: .None)
            }
            else{
            
                // Add a new meal.
                let newIndexPath = NSIndexPath(forRow: spends.count, inSection: 0)
                spends.append(spend)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            
        }
    }
    
    
    //MARK: NSCoding
    func saveSpends(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(spends, toFile: Spend.ArchiveURL!.path!)
        if !isSuccessfulSave{
            print("Bla")
        }
        
    }
    
    func loadSpends() -> [Spend]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Spend.ArchiveURL!.path!) as? [Spend]
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
