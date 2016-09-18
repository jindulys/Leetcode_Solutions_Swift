//
//  7_ReverseInteger.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:7 Reverse Integer
	URL: https://leetcode.com/problems/reverse-integer/
	Space: O(1)
	Time: O(1)
 */

class ReverseInteger_Solution {
  func reverse(_ x: Int) -> Int {
    var loopVariable = x
    var res = 0
    while loopVariable != 0 {
      res = res * 10 + loopVariable % 10
      loopVariable = loopVariable / 10
      if res > Int(Int32.max) || res < Int(Int32.min) {
        return 0
      }
    }
    return res
  }
}
