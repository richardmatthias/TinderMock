//
//  ProfileViewController.swift
//  TinderDemo
//
//  Created by Langtian Qin on 4/13/18.
//  Copyright © 2018 Langtian Qin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageImageView: UIImageView!
    var image1:UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageImageView.image=image1
        // Do any additional setup after loading the view.
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
