//
//  MainMenuViewController.swift
//  CVTest
//
//  Created by Joseph Skimmons on 6/19/17.
//  Copyright © 2017 Joseph Skimmons. All rights reserved.
//

import UIKit
import AVFoundation

class MainMenuViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var responseField: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var journalView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            //menuButton.target = self.revealViewController()
            //menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        responseField.delegate = self
        
        let defaults = UserDefaults.standard
        
        if let journal = defaults.string(forKey: "journal") {
            DispatchQueue.main.async {
                self.journalView.text = journal
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MActionBtn(_ sender: Any) {
    }
    
    @IBAction func clearButton(_ sender: Any) {
        journalView.text = ""
        let defaults = UserDefaults.standard
        defaults.set("", forKey: "journal")
    }
    
    @IBAction func cancelToViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func cancelSettingsToViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func savesSettingsDetail(segue:UIStoryboardSegue) {
        
        let VC = segue.source as! SettingsTableViewController
        

        let defaults = UserDefaults.standard

        defaults.set(VC.phraseTF.text, forKey: "phrase")
        defaults.set(VC.lastNameTF.text, forKey: "lastName")
        defaults.set(VC.firstNameTF.text, forKey: "firstName")
        defaults.set(VC.bdayDisplay.text, forKey: "bday")
        defaults.set(VC.anxietyS.isOn, forKey: "anxiety")
        defaults.set(VC.dissociationS.isOn, forKey: "dissociation")
        defaults.set(VC.depressionS.isOn, forKey: "depression")
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        journalView.text = journalView.text + "\n" +  self.getDateTime() + "\n" + questionLabel.text! + "\n" + responseField.text!
        textField.resignFirstResponder()
        let defaults = UserDefaults.standard
        defaults.set(self.journalView.text, forKey: "journal")
        textField.text = ""
        return true
    }
    
    func getDateTime() -> String {
        // returns string of date and time for journal
        
        var AMPMString = " AM"
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        let year = components.year!
        let month = components.day!
        let day = components.month!
        
        var hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        if (hour > 12){
            hour %= 12
            AMPMString = " PM"
        }
        
        var timeString = String(describing: hour) + ":" + String(describing: minutes) + AMPMString
        
        var dateString = String(describing: month) + "-" + String(describing: day) + "-" + String(describing: year)
        
        return dateString + "," + timeString
    }
    
    func randomQuestion() {
        // randomizes question in questionLabel
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
