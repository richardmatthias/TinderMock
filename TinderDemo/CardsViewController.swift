//
//  CardsViewController.swift
//  TinderDemo
//
//  Created by Langtian Qin on 4/13/18.
//  Copyright © 2018 Langtian Qin. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardView: UIImageView!
    var cardInitialCenter:CGPoint!
    var currentRotation:CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "profileSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let desti=segue.destination as! ProfileViewController
        desti.image1=cardView.image!
    }
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
            let location = sender.location(in: view)
            let velocity = sender.velocity(in: view)
            let translation = sender.translation(in: view)
            
            if sender.state == .began {
               cardInitialCenter=cardView.center
                currentRotation=0
            } else if sender.state == .changed {
                cardView.center=CGPoint(x: cardInitialCenter.x+translation.x, y: cardInitialCenter.y+translation.y)
                if(location.y<cardInitialCenter.y){
                    if(translation.x>0){
                        currentRotation=currentRotation.advanced(by: 0.02)
                        cardView.transform=view.transform.rotated(by: currentRotation)
                    }
                    else{
                        currentRotation=currentRotation.advanced(by: -0.02)
                        cardView.transform=view.transform.rotated(by: currentRotation)
                    }
                }
                else{
                    if(translation.x<0){
                        currentRotation=currentRotation.advanced(by: 0.02)
                        cardView.transform=view.transform.rotated(by: currentRotation)
                    }
                    else{
                        currentRotation=currentRotation.advanced(by: -0.02)
                        cardView.transform=view.transform.rotated(by: currentRotation)
                    }

                }
            } else if sender.state == .ended {
                if(translation.x>50){
                    UIView.animate(withDuration: 0.4, animations: {
                        self.cardView.alpha=0
                    })
                }
                else if(translation.x<(-50)){
                    UIView.animate(withDuration: 0.4, animations: {
                        self.cardView.alpha=0
                    })
                }
                else{
                    cardView.center=cardInitialCenter
                    cardView.transform=CGAffineTransform.identity
                }
            }
        
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
