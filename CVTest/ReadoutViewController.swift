//
//  ReadoutViewController.swift
//  CVTest
//
//  Created by Joseph Skimmons on 7/26/17.
//  Copyright © 2017 Joseph Skimmons. All rights reserved.
//

import UIKit
import AVFoundation


class ReadoutViewController: UIViewController, AVSpeechSynthesizerDelegate {
    
    @IBOutlet weak var readoutLabel: UILabel!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            //menuButton.target = self.revealViewController()
            //menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        let defaults = UserDefaults.standard
        
        let day = String(describing: self.getDay()!)
        let year = String(describing: self.getYear())
        let month = self.getMonth()
        
        let line1 = "Hello " + defaults.string(forKey: "firstName")! + "," + " please try to stay relaxed "
        let line2 = "This is just a memory."
        let line3 = "You are safe"
        let line4 = "Today's date is " + month + " " + day + " " + year
        let line5 = "And the time is time"
        let line6 = "Right now, you are at location"
        let line7 = "Try to keep your eyes open and breathe"
        let line8 = "What you're feeling is a memory"
        let line9 = "You're age years old"
        let line10 = "The events you're remembering are in the past"
        let line11 = "Try to remember"
        let line12 = "You felt safe there"
        let line13 = "Try to remember"
        let line14 = "That made you smile"
        let line15 = "You're age years old"
        let line16 = "The events you're remembering are in the past"
        let line17 = defaults.string(forKey: "firstName")! + ", you are safe."
        
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.delegate = self
        
        
        activateSpeech(input: line1, synth: synthesizer)
        activateSpeech(input: line2, synth: synthesizer)
        activateSpeech(input: line3, synth: synthesizer)
        
        if (defaults.bool(forKey: "dissociation")){
            activateSpeech(input: line4, synth: synthesizer)
            activateSpeech(input: line5, synth: synthesizer)
            activateSpeech(input: line6, synth: synthesizer)
        }
        if (defaults.bool(forKey: "anxiety")){
            activateSpeech(input: line7, synth: synthesizer)
            activateSpeech(input: line8, synth: synthesizer)
            activateSpeech(input: line9, synth: synthesizer)
        }
        if (defaults.bool(forKey: "dissociation")){
            activateSpeech(input: line8, synth: synthesizer)
            activateSpeech(input: line9, synth: synthesizer)
        }

        activateSpeech(input: line10, synth: synthesizer)

        if (defaults.bool(forKey: "dissociation")){
            activateSpeech(input: line11, synth: synthesizer)
            activateSpeech(input: line12, synth: synthesizer)
        }
        if (defaults.bool(forKey: "depression")){
            activateSpeech(input: line13, synth: synthesizer)
            activateSpeech(input: line14, synth: synthesizer)
        }
        if (defaults.bool(forKey: "dissociation")){
            activateSpeech(input: line15, synth: synthesizer)

        }
        activateSpeech(input: line16, synth: synthesizer)
        activateSpeech(input: line17, synth: synthesizer)
        
        
        
    }
    
        
/*
        let defaults = UserDefaults.standard
        let line1 = "Hello " + defaults.string(forKey: "firstName")! + "," + " please try to stay relaxed "
        let line2 = "This is just a memory "
        let line3 = "You are safe"
        var readout = line1 + line2 + line3
 */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        let mutableAttributedString = NSMutableAttributedString(string: utterance.speechString)
        mutableAttributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: characterRange)
        readoutLabel.attributedText = mutableAttributedString
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        readoutLabel.attributedText = NSAttributedString(string: utterance.speechString)
    }
    
    func activateSpeech(input: String, synth : AVSpeechSynthesizer) {
        
        self.readoutLabel.text = input
        
        let utterance = AVSpeechUtterance(string: input)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        
        synth.speak(utterance)
        
    }
    
    func getMonth() -> String {
        
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)

        let month = components.month

        
        var yearString = ""
        
        switch (month!) {
        case 1:
            yearString = "January"
        case 2:
            yearString = "February"
        case 3:
            yearString = "March"
        case 4:
            yearString = "April"
        case 5:
            yearString = "May"
        case 6:
            yearString = "June"
        case 7:
            yearString = "July"
        case 8:
            yearString = "August"
        case 9:
            yearString = "September"
        case 10:
            yearString = "October"
        case 11:
            yearString = "November"
        case 12:
            yearString = "December"
        default:
            yearString = "error"
        }
        
        return yearString
        
    }
    
    func getYear() -> Int {
        
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        let year = components.year!
        
        return year
        
    }
    
    func getDay() -> Int? {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        let day = components.day
        
        return day
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
