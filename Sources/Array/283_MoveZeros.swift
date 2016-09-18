//
//  283_MoveZeros.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:283 Move Zeroes
	URL: https://leetcode.com/problems/move-zeroes/
	Space: O(1)
	Time: O(n)
 */

class MoveZeros_Solution {
  func moveZeroes(_ nums: inout [Int]) {
    var firstZeroIndex: Int = -1
    /// 1 2 3 0 0 1 2
    /// 1 2 3 1 0 0 2
    for i in 0..<nums.count {
      if nums[i] != 0 && firstZeroIndex != -1 {
        // Switch firstZeroIndex
        swap(&nums[i], &nums[firstZeroIndex])
        firstZeroIndex += 1
      } else if nums[i] == 0 && firstZeroIndex == -1 {
        // Set the first zero index
        firstZeroIndex = i
      }
    }
  }
}
