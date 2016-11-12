//
//  338_CountingBits.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-12.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:338 Counting Bits
	URL: https://leetcode.com/problems/counting-bits/
	Space: O(N)
	Time: O(N)
 */

class CountingBits_Solution {
  func countBits(_ num: Int) -> [Int] {
    guard num > 0 else {
      return [0]
    }
    var result = Array(repeating: 0, count: num + 1)
    var x = 1
    for i in 1...num {
      if i == x {
        x = x << 1
        result[i] = 1
      } else {
        result[i] = result[i - (x >> 1)] + 1
      }
    }
    return result
  }
}
