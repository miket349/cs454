//
//  ViewController.swift
//  Roshambo
//
//  Created by Thong, Mikey on 6/29/16.
//  Copyright © 2016 Thong, Mikey. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    var history = [match]()
    
    @IBAction func playRock(sender: UIButton) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        controller.userChoice = getUserChoice(sender)
        presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func playPaper(sender: UIButton) {
        performSegueWithIdentifier("playIt", sender: sender)
    }
    
    @IBAction func viewHistory(sender: UIButton) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController") as! HistoryViewController
        controller.history = self.history
        presentViewController(controller, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "playIt" {
            let controller = segue.destinationViewController as! ResultViewController
            controller.userChoice = getUserChoice(sender as! UIButton)
        }
    }
    
    func getUserChoice(sender: UIButton) -> Choice {
        let choice = sender.titleForState(.Normal)!
        return Choice(rawValue: choice)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

