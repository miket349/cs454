//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Thong, Mikey on 7/12/16.
//  Copyright © 2016 Thong, Mikey. All rights reserved.
//

import UIKit
import Foundation

struct Match {
    let playerMove: Choice
    let opponentMove: Choice
    let matchDate: NSDate
    
    init(player: Choice, opponent: Choice) {
        self.playerMove = player
        self.opponentMove = opponent
        self.matchDate = NSDate()
    }
}

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var history = [Match]()
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell")! as UITableViewCell
        let matchGame = self.history[indexPath.row]
        cell.textLabel!.text = gameStatus(matchGame)
        cell.detailTextLabel!.text = "\(matchGame.playerMove) vs. \(matchGame.opponentMove)"
        return cell
    }
    
    func gameStatus(match: Match) -> String {
        if Choice.playerWin(match.playerMove, match.opponentMove) == true {
            return "Win!"
        } else if match.playerMove == match.opponentMove {
                return "Tie"
        } else {
            return "Lose"
        }
    }
}
