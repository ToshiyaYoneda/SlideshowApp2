//
//  ViewController.swift
//  SlideshowApp
//
//  Created by ToshiyaYoneda on 2019/09/18.
//  Copyright © 2019 ToshiyaYoneda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var UIImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var playStopButton: UIButton!
    
    var imageIndex = 0
    var timer: Timer!
    
    let images = [UIImage(named: "bird"), UIImage(named: "kappa"), UIImage(named: "turtle")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageView = images.first!
        
        UIImageView.image = imageView
        UIImageView.contentMode = UIView.ContentMode.center
        
        UIImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.UIImageViewTapped(_:))))
    }
    
    @objc func UIImageViewTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "toBigViewController", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}
    
    func buttonEnabled(back: Bool,next :Bool,playStop :Bool){
        self.backButton.isEnabled = back
        self.nextButton.isEnabled = next
        self.playStopButton.isEnabled = playStop
    }
    
    
    
    @IBAction func back(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = images.count - 1
        } else {
            imageIndex -= 1
        }
        UIImageView.image = images[imageIndex]
        UIImageView.contentMode = UIView.ContentMode.center
    }
    
    @IBAction func next(_ sender: Any) {
        if imageIndex == images.count - 1 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        UIImageView.image = images[imageIndex]
        UIImageView.contentMode = UIView.ContentMode.center
    }
    
  
    @IBAction func playStop(_ sender: Any) {
        
        if let slide = timer{
            if slide.isValid == true {
                slide.invalidate()
                buttonEnabled(back: true,next :true,playStop :true)
            }else{
                    starttimer()
                    buttonEnabled(back: false,next :false,playStop :true)
              }
            }
        
        if self.timer == nil{
           starttimer()
           buttonEnabled(back: false,next :false,playStop :true)
        }
    }
    
    func starttimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
    }
        
    @objc func onTimer(_ timer: Timer) {
        if imageIndex == images.count - 1 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        UIImageView.image = images[imageIndex]
        UIImageView.contentMode = UIView.ContentMode.center
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let BVC = segue.destination as! BigViewController
            
        BVC.Img = self.UIImageView.image
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
