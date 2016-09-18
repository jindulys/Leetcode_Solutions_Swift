//
//  1_TwoSum.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-28.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:1 Two Sum
	URL: https://leetcode.com/problems/two-sum/
	Space: O(n)
	Time: O(n)
 */

class TwoSum_Solution {
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var expectedDict: [Int: Int] = [:]
    for i in 0..<nums.count {
      if let pairedIndex = expectedDict[nums[i]] {
        return [pairedIndex, i]
      } else {
        expectedDict[target - nums[i]] = i
      }
    }
    return []
  }
}
