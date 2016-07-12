//
//  ActivityViewController.swift
//  Meme Me
//
//  Created by Thong, Mikey on 7/9/16.
//  Copyright © 2016 Thong, Mikey. All rights reserved.
//

import UIKit
import Foundation

class ActivityViewController: UIViewController {
    
    @IBOutlet weak var memeImage: UIImage!
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        topText.enabled = false
        bottomText.enabled = false
    }
    
}