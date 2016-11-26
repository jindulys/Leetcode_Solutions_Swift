//
//  293_FlipGame.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-26.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:293 Flip Game
	URL: https://leetcode.com/problems/flip-game/
	Space: O(N)
	Time: O(N)
 */

class FlipGame_Solution {
  func generatePossibleNextMoves(_ s: String) -> [String] {
    guard s.characters.count > 1 else {
      return []
    }
    var result: [String] = []
    let characters = [Character](s.characters)
    for i in 0..<(characters.count - 1) {
      if characters[i] == characters[i + 1], characters[i] == "+" {
        var candidate = characters
        candidate[i] = "-"
        candidate[i + 1] = "-"
        result.append(String(candidate))
      }
    }
    return result
  }
}
