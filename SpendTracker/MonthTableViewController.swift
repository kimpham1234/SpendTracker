//
//  MonthTableViewController.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/30/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class MonthTableViewController: UITableViewController {
    
    //MARK: Properties
    var months = [Month]()
    
    func loadSampleMonths(){
        let month1 = Month(name: "June")!
        
        let day1 = Day(date: "day1 of month1")
        let photo1 = UIImage(named: "yes icon")!
        let spend1 = Spend(item: "chocopie", price: 2.50, image: photo1, needed: true)!
        day1.addSpend(spend1)
        month1.addDay(day1)
    
        
        let month2 = Month(name: "July")!
        
        months += [month1, month2]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleMonths()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return months.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "MonthTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MonthTableViewCell
        
        let month = months[indexPath.row]

        cell.monthLabel.text = month.name
        cell.monthTotalLabel.text = "$ "+String(month.total)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            months.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
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
        if(segue.identifier=="ShowDetail3"){
            let monthDetailViewController = segue.destinationViewController as! DayTableViewController
            
            if let selectedMonthCell = sender as? MonthTableViewCell{
                let indexPath = tableView.indexPathForCell(selectedMonthCell)!
                let selectedMonthCell = months[indexPath.row]
                
                monthDetailViewController.days = selectedMonthCell.days
            }
        }
        
        
    }
    

    
    //MARK: Action
    
    @IBAction func addMonth(sender: UIBarButtonItem) {
        let month = Month(name: "Some Month")!
        
        let newIndexPath = NSIndexPath(forRow: months.count, inSection: 0)
        
        months += [month]
        
        tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .None)
        
    }
   
    @IBAction func unwindtoMonthList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.sourceViewController as? DayTableViewController{
            let days = sourceViewController.days
            if(!days.isEmpty){
                if let selectedPath = tableView.indexPathForSelectedRow{
                    
                    months[selectedPath.row].days = days
                    months[selectedPath.row].resetTotal()
                    
                    tableView.reloadRowsAtIndexPaths([selectedPath], withRowAnimation: .None)
                    
                    
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
}
