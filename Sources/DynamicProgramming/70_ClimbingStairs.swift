//
//  70_ClimbingStairs.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-22.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:70 Climbing Stairs
	URL: https://leetcode.com/problems/climbing-stairs/
	Space: O(1)
	Time: O(N)
 */

class ClimbingStairs_Solution {
  func climbStairs(_ n: Int) -> Int {
    guard n > 0 else {
      return 0
    }
    var oneStepPrev = 1
    var twoStepPrev = 0
    var ret = 0
    for i in 1...n {
      ret = 0
      if i - 1 >= 0 {
        ret += oneStepPrev
      }
      if i - 2 >= 0 {
        ret += twoStepPrev
      }
      twoStepPrev = oneStepPrev
      oneStepPrev = ret
    }
    return ret
  }
}
