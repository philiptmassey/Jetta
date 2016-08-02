//
//  Game.swift
//  jetta
//
//  Created by Philip Massey on 8/1/16.
//  Copyright © 2016 Chainbreaker. All rights reserved.
//

import Foundation

enum GameState {
    case PlayerOneInitialize
    case PlayerTwoInitialize
    case PlayerOneTurn
    case PlayerTwoTurn
    case PlayerOneWon
    case PlayerTwoWon
}

class Game {
    
    var playerOne = Player()
    var playerTwo = Player()
    var playerOneSecret = ""
    var playerTwoSecret = ""
    var playerOneGuesses = [String]()
    var playerTwoGuesses = [String]()
    var turnNumber = 1
    var state = GameState.PlayerOneInitialize
    
    var dictionary = Set<String>()
    
    // MARK: Initialization
    
    init() {
        self.loadDictionary()
    }
    
    func loadDictionary() {
        if let filepath = NSBundle.mainBundle().pathForResource("words", ofType: "txt") {
            do {
                let content = try NSString(contentsOfFile: filepath, usedEncoding: nil) as String
                for word in content.componentsSeparatedByString("\n") {
                    self.dictionary.insert(word)
                }
            } catch {
                fatalError("Word dictionary failed to parse as a string.")
            }
        } else {
            fatalError("Word dictionary file not found.")
        }
    }
    
    // MARK: Gameplay
    
    func isValidGuess(word: String) -> Bool {
        return self.dictionary.contains(word)
    }
    
    func wordOverlap(word1: String, word2: String) -> Int {
        var overlap = 0
        var word2Array = Array(word2.characters)
        
        for char in word1.characters {
            if let index = word2Array.indexOf(char) {
                word2Array.removeAtIndex(index)
                overlap += 1
            }
        }
        
        return overlap
    }
    
    
}