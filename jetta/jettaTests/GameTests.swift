//
//  GameTests.swift
//  jetta
//
//  Created by Philip Massey on 8/1/16.
//  Copyright © 2016 Chainbreaker. All rights reserved.
//

import XCTest
@testable import jetta

class Gametests: XCTestCase {
    
    func testOverlap() {
        let game = Game()
        
        XCTAssert(game.wordOverlap("aaaaa", word2: "aaaaa") == 5)
        XCTAssert(game.wordOverlap("aaaaa", word2: "aaaab") == 4)
        XCTAssert(game.wordOverlap("aaaab", word2: "aaaab") == 5)
        XCTAssert(game.wordOverlap("aaabb", word2: "aaabb") == 5)
        XCTAssert(game.wordOverlap("asdfg", word2: "asdfg") == 5)
        XCTAssert(game.wordOverlap("aaaaa", word2: "assss") == 1)
        XCTAssert(game.wordOverlap("assss", word2: "aaaaa") == 1)
    }
}