//
//  PracticeGame.swift
//  jetta
//
//  Created by Philip Massey on 8/1/16.
//  Copyright © 2016 Chainbreaker. All rights reserved.
//

import Foundation

class PracticeGame: Game {
    
    init(playerOne: Player) {
        super.init()
        
        self.playerOne = playerOne
        self.chooseWord()
    }
    
    func chooseWord() {
        let random = Int(arc4random_uniform(UInt32(self.dictionary.count)))
        for (i, word) in self.dictionary.enumerate() {
            if i == random {
                self.playerTwoSecret = word
                NSLog("secret " + word)
                break
            }
        }
    }
        
    func guess(word: String) {
        self.playerOneGuesses.append(word)

        if word == self.playerTwoSecret {
            self.state = GameState.PlayerOneWon
        }
    }
    
    
}