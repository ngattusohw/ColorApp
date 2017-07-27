//
//  ReadoutViewController.swift
//  CVTest
//
//  Created by Joseph Skimmons on 7/26/17.
//  Copyright © 2017 Joseph Skimmons. All rights reserved.
//

import UIKit
import AVFoundation


class ReadoutViewController: UIViewController {
    
    var readoutArray : Array<String> = []
    var counter : Int = 0
    var timer : Timer = Timer()
    
    @IBOutlet weak var readoutLabel: UILabel!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let line1 = "Hello " + defaults.string(forKey: "firstName")! + "," + " please try to stay relaxed "
        let line2 = "This is just a memory "
        let line3 = "You are safe"
        var readout = line1 + line2 + line3
        
        readoutArray = readout.components(separatedBy: " ")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func timerAction() {
        
        let utterance = AVSpeechUtterance(string: readoutArray[counter])
        utterance.voice = AVSpeechSynthesisVoice(language: "en_US")
        
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
        
        self.readoutLabel.text = "\(readoutArray[counter])"
        counter += 1
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
