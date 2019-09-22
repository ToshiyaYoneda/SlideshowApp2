//
//  BigViewController.swift
//  SlideshowApp
//
//  Created by ToshiyaYoneda on 2019/09/18.
//  Copyright © 2019 ToshiyaYoneda. All rights reserved.
//

import UIKit

class BigViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var Img: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = self.Img
        
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
