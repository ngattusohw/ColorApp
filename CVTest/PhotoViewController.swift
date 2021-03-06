//
//  PhotoViewController.swift
//  CustomCamera
//
//  Created by Joseph Skimmons on 24/01/2017.
//  Copyright © 2017 Joseph Skimmons. All rights reserved.
//  Collect Software

import UIKit

class PhotoViewController: UIViewController {

    var takenPhoto:UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let availableImage = takenPhoto {
            //let newImage = filter(originalimage: availableImage)
            //let colors = UIImage(image: availableImage).getColors(),
            imageView.image = availableImage
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
