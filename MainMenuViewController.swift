//
//  MainMenuViewController.swift
//  CVTest
//
//  Created by Joseph Skimmons on 6/19/17.
//  Copyright © 2017 Joseph Skimmons. All rights reserved.
//

import UIKit
import AVFoundation

class MainMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            //menuButton.target = self.revealViewController()
            //menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        
        let utterance = AVSpeechUtterance(string: "Saved?")
        utterance.voice = AVSpeechSynthesisVoice(language: "en_US")
        
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    
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
