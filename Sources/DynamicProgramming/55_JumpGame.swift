//
//  55_JumpGame.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-12-10.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:55 Jump Game
	URL: https://leetcode.com/problems/jump-game/
	Space: O(n)
	Time: O(n)
 */

class JumpGame_Solution {
  func canJump(_ nums: [Int]) -> Bool {
    guard nums.count > 0 else {
      return false
    }
    let m = nums.count
    // Current max reachable point.
    var currentMaxReachable = 0
    var canJump = Array(repeating: false, count: m)
    canJump[0] = true
    for i in 0..<m {
      if canJump[i] == true && nums[i] != 0 {
        let upperBound = min(m - 1, i + nums[i])
        if upperBound > currentMaxReachable {
          for j in currentMaxReachable...upperBound {
            canJump[j] = true
          }
        }
        currentMaxReachable = upperBound
      }
    }
    return canJump[m - 1]
  }
}
