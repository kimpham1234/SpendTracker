//
//  DayTableViewController.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/21/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class DayTableViewController: UITableViewController {

    //MARK: Properties
    
    var days = [Day]()
    
    func loadSampleDays(){
        let day1 = Day(date: "day 1")
        let photo1 = UIImage(named: "yes icon")!
        let spend1 = Spend(item: "chocopie", price: 2.50, image: photo1, needed: true)!
        day1.addSpend(spend1)
        
        let day2 = Day(date: "day 2")
        let photo2 = UIImage(named: "no icon")!
        let spend2 = Spend(item: "whole cake", price: 32, image: photo2, needed: true)!
        day2.addSpend(spend2)

        let day3 = Day(date: "day 3")
        let spend3 = Spend(item: "whole pie", price: 32, image: photo2, needed: true)!
        day3.addSpend(spend3)
        
        
        days += [day1, day2, day3]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // loadSampleDays()
        
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
        return days.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DayTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DayTableViewCell
        
        let day = days[indexPath.row]
        
        cell.dayLabel.text = day.date.capitalizedString + "           Total: $" + String(day.total)
        
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
            days.removeAtIndex(indexPath.row)
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
        if(segue.identifier=="ShowDetail2"){
            let dayDetailViewController = segue.destinationViewController as! SpendTableViewController
            
            if let selectedDayCell = sender as? DayTableViewCell{
                let indexPath = tableView.indexPathForCell(selectedDayCell)!
                let selectedDayCell = days[indexPath.row]
                
                dayDetailViewController.spends = selectedDayCell.spendings
                
            }
            
        }
        
        
        
    }
 

    //MARK: Action
    
    @IBAction func addDay(sender: UIBarButtonItem) {
        let day = Day(date: "Some Day")
        
        let newIndexPath = NSIndexPath(forRow: days.count, inSection: 0)
        days += [day]
        tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .None)
    }
    
    
    @IBAction func unwindtoDayList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.sourceViewController as? SpendTableViewController{
            let spendings = sourceViewController.spends
            if(!spendings.isEmpty){
                if let selectedPath = tableView.indexPathForSelectedRow{
            
                    days[selectedPath.row].spendings = spendings
                    days[selectedPath.row].resetTotal()
                    
                    tableView.reloadRowsAtIndexPaths([selectedPath], withRowAnimation: .None)
                }
            }
        }
    }
    
    }






    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

