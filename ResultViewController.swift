//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Thong, Mikey on 6/29/16.
//  Copyright © 2016 Thong, Mikey. All rights reserved.
//

import UIKit

enum Choice: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func getOpponentChoice() -> Choice {
        let choice = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Choice(rawValue: choice[randomChoice])!
    }
    
    func playerWin(player: Choice, opponent: Choice) -> Bool {
        switch(player, opponent) {
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            return false
        default:
            return true
        }
    }
}

class ResultViewController: UIViewController {
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var imageResult: UIImageView!
    
    var userChoice: Choice!
    let opponentChoice: Choice = Choice.getOpponentChoice()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        result()
    }
    
    private func result() {
        var imageName: String
        var labelText: String
        
        let imagePicName = "\(userChoice.rawValue)\(opponentChoice.rawValue)"
        let matchName = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        switch(userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            imageName = "Tie"
            labelText = "\(matchName)Tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            imageName = imagePicName
            labelText = "\(matchName)\nWin!"
        default:
            imageName = imagePicName
            labelText = "\(matchName)\nLose..."
        }
        
        labelResult.text = labelText
        imageResult.image = UIImage(named: imageName)
    }
    
    @IBAction func playAgain() {
        dismissViewControllerAnimated(true, completion: nil)
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