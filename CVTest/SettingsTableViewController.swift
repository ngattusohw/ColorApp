
//
//  SettingsTableViewController.swift
//  CVTest
//
//  Created by Joseph Skimmons on 6/19/17.
//  Copyright © 2017 Joseph Skimmons. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var phraseTF: UITextField!
    @IBOutlet weak var bdayPick: UIDatePicker!
    @IBOutlet weak var bdayDisplay: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    
    
    @IBAction func bdayPickAction(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let strDate = dateFormatter.string(from: bdayPick.date)
        self.bdayDisplay.text = strDate
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        //print(bdayPick.date)
        

        
        let defaults = UserDefaults.standard
        
        if let phrase = defaults.string(forKey: "phrase") {
            DispatchQueue.main.async {
                self.phraseTF.text = phrase
            }
        }
        if let lastName = defaults.string(forKey: "lastName") {
            DispatchQueue.main.async {
                self.lastNameTF.text = lastName
            }
        }
        if let firstName = defaults.string(forKey: "firstName") {
            DispatchQueue.main.async {
                self.firstNameTF.text = firstName
            }
        }
        if let bday = defaults.string(forKey: "bday") {
            DispatchQueue.main.async {
                self.bdayDisplay.text = bday
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func getPhrase() -> String{
//        if let retP = self.phraseTF?.text {
//            return retP
//        } else {
//            return "onbvc"
//        }
//    }
//    
//    func getLastName() -> String{
//        if let retL = self.lastNameTF?.text {
//            return retL
//        } else {
//            return "hbvcx"
//        }
//    }
//    
//    func getFirstName() -> String{
//        if let retF = self.firstNameTF?.text {
//            return retF
//        } else {
//            return "jgfd"
//        }
//        
//    }
    
//    func updateInfo() {
//        print(self.lastNameTF?.text)
//        let defaults = UserDefaults.standard
//        defaults.set(self.phraseTF?.text, forKey: "phraseCurrent")
//        defaults.set(self.firstNameTF?.text, forKey: "firstCurrent")
//        defaults.set(self.lastNameTF?.text, forKey: "lastCurrent")
//    }

    // MARK: - Table view data source
        
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    
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