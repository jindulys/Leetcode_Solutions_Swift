//
//  263_UglyNumber.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:263 Ugly Number
	URL: https://leetcode.com/problems/ugly-number/
	Space: O(1)
	Time: O(1)
 */

class UglyNumber_Solution {
  func isUgly(_ num: Int) -> Bool {
    guard num > 0 else {
      return false
    }
    var loopNum = num
    while loopNum != 1 {
      if loopNum % 2 == 0 {
        loopNum /= 2
      } else if loopNum % 3 == 0 {
        loopNum /= 3
      } else if loopNum % 5 == 0 {
        loopNum /= 5
      } else {
        return false
      }
    }
    return true
  }
}
