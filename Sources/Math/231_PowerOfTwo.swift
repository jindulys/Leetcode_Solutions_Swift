//
//  231_PowerOfTwo.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:231 Power of Two
	URL: https://leetcode.com/problems/power-of-two/
	Space: O(1)
	Time: O(1)
 */

class PowerOfTwo_Solution {
  func isPowerOfTwo(n: Int) -> Bool {
    guard n > 0 else {
      return false
    }
    return n & (n - 1) == 0
  }
}
