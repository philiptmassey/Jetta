//
//  ViewController.swift
//  jetta
//
//  Created by Philip Massey on 8/1/16.
//  Copyright © 2016 Chainbreaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    var game: PracticeGame?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.game = PracticeGame(playerOne: Player())
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.game!.playerOneGuesses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let word = self.game!.playerOneGuesses[indexPath.row]
        let overlap = self.game?.wordOverlap(word, word2: self.game!.playerTwoSecret)
        let text = String(overlap) + " - " + word
        cell.textLabel!.text = text
        return cell
    }


    @IBAction func guess(sender: AnyObject) {
        if let text = self.textfield.text {
            if self.game!.isValidGuess(text) {
                self.game!.guess(text)
                self.tableview.reloadData()
            } else {
                NSLog("bleh")
            }
        }
    }
}

