//
//  198_HouseRobber.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-15.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:198 House Robber
	URL: https://leetcode.com/problems/house-robber/
	Space: O(n)
	Time: O(n)
 */

class HouseRobber_Solution {
  func rob(nums: [Int]) -> Int {
    guard nums.count > 0 else {
      return 0
    }
    // NOTE: The maximum value by robbing current room.
    var robCurrentRoom = Array(count: nums.count, repeatedValue: 0)
    // NOTE: The maximum value by not robbing current room.
    var noRobCurrentRoom = Array(count: nums.count, repeatedValue: 0)
    for i in 0..<nums.count {
      if i == 0 {
        robCurrentRoom[i] = nums[0]
      } else if i == 1 {
        robCurrentRoom[i] = nums[1]
        noRobCurrentRoom[i] = robCurrentRoom[i - 1]
      } else {
        robCurrentRoom[i] = max(robCurrentRoom[i - 2], noRobCurrentRoom[i - 2]) + nums[i]
        noRobCurrentRoom[i] = max(robCurrentRoom[i - 1], noRobCurrentRoom[i - 1])
      }
    }
    return max(robCurrentRoom[nums.count - 1], noRobCurrentRoom[nums.count - 1])
  }
}
