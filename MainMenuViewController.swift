//
//  MainMenuViewController.swift
//  CVTest
//
//  Created by Joseph Skimmons on 6/19/17.
//  Copyright © 2017 Joseph Skimmons. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let setter = SettingsTableViewController()
        
        let defaults = UserDefaults.standard
        //setter.updateInfo()
        defaults.set(setter.getPhrase(), forKey: "phrase")
        defaults.set(setter.getLastName(), forKey: "lastName")
        defaults.set(setter.getFirstName(), forKey: "firstName")
        
//        defaults.set(setter.getPhrase(), forKey: "phrase")
//        defaults.set(setter.getLastName(), forKey: "lastName")
//        defaults.set(setter.getFirstName(), forKey: "firstName")
        
        print(setter.getFirstName())
    
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
