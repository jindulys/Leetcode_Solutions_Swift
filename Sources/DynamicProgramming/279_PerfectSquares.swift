//
//  279_PerfectSquares.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-14.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:279 Unique Paths II
	URL: https://leetcode.com/problems/perfect-squares/
	Space: O(n)
	Time: O(n^2)
 */

class PerfectSquares_Solution {
  func numSquares(n: Int) -> Int {
    guard n > 0 else {
      return 0
    }
    // NOTE: perfectNums is an Array, which stores the minimum nums of square numbers
    // to sum up for index 'i'.
    var perfectNums = Array(count: n + 1, repeatedValue: Int.max)
    perfectNums[0] = 0
    for i in 1...n {
      for j in 1...i {
        if j * j > i {
          break
        }
        perfectNums[i] = min(perfectNums[i], perfectNums[i - j * j] + 1)
      }
    }
    return perfectNums[n]
  }
}
