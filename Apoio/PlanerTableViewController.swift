//
//  PlanerTableViewController.swift
//  Apoio
//
//  Created by Jennifer Yen on 3/3/18.
//  Copyright © 2018 jenyen. All rights reserved.
//

import UIKit

class PlanerTableViewController: UITableViewController {
    
    var trip : Trip? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(handleBarButton))
        if let titleString = trip?.title {
            title = titleString
        }
    }
    
    @objc func handleBarButton() {
//        showAlertWith()
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let addActivityButton = UIAlertAction(title: "Add Activity", style: .default) { (action) in
            self.showAlertWith()
        }
        let addSaveButton = UIAlertAction(title: "Save Trip", style: .default) { (action) in
            if let trip = self.trip {
                // save trip to DataSource
                DataSource.sharedInstance.trips.append(trip)
                
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        actionSheet.addAction(addActivityButton)
        actionSheet.addAction(addSaveButton)
        present(actionSheet, animated: true, completion: nil)
    }
    
    func showAlertWith() {

        let alert = UIAlertController(title: "Add New Plan", message: "Enter an activity for a specified date", preferredStyle: .alert)
        alert.addTextField { (dateTextField) in
            dateTextField.placeholder = "Date"
        }
        alert.addTextField { (activityTextField) in
            activityTextField.placeholder = "Activity"
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            if let date = alert.textFields?.first?.text, let activity = alert.textFields?.last?.text, !date.isEmpty, !activity.isEmpty {
                print("date: \(date), activity: \(activity)")
                let plan = Plan(date: date, activity: activity)
                self.trip?.plans.append(plan)
                self.tableView.reloadData()
            }
        }
        alert.addAction(cancelButton)
        alert.addAction(saveButton)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return trip?.plans.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCellID", for: indexPath)
        cell.textLabel?.text = trip?.plans[indexPath.row].activity
        cell.detailTextLabel?.text = trip?.plans[indexPath.row].date
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
