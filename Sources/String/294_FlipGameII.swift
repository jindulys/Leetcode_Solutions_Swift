//
//  294_FlipGameII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-26.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:294 Flip Game
	URL: https://leetcode.com/problems/flip-game-ii/
	Space: O(2^(n/2))
	Time: O(2^(n/2))
 */

class FlipGameII_Solution {
  var canWinDict: [String : Bool] = [:]
  func canWin(_ s: String) -> Bool {
    guard s.characters.count > 1 else {
      return false
    }
    let characters = [Character](s.characters)
    return canWin(characters)
  }

  func canWin(_ c: [Character]) -> Bool {
    let currentString = String(c)
    if let validResult = self.canWinDict[currentString] {
      return validResult
    }
    for i in 0..<c.count - 1 {
      if c[i] == c[i + 1] && c[i] == "+" {
        var newCharacters = c
        newCharacters[i] = "-"
        newCharacters[i+1] = "-"
        if !canWin(newCharacters) {
          self.canWinDict[currentString] = true
          return true
        }
      }
    }
    self.canWinDict[currentString] = false
    return false
  }

  func test() {
    let test = "+++++"
    let result = canWin(test)
    print(result)
  }
}
