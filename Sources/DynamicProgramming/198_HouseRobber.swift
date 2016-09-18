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
  func rob(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
      return 0
    }
    // NOTE: The maximum value by robbing current room.
    var robCurrentRoom = Array(repeating: 0, count: nums.count)
    for i in 0..<nums.count {
      if i == 0 {
        robCurrentRoom[i] = nums[0]
      } else if i == 1 {
        robCurrentRoom[i] = max(nums[0], nums[1])
      } else {
        robCurrentRoom[i] = max(robCurrentRoom[i - 2] + nums[i], robCurrentRoom[i - 1])
      }
    }
    return robCurrentRoom[nums.count - 1]
  }
  
  /**
   Title:198 House Robber
   URL: https://leetcode.com/problems/house-robber/
   Space: O(1)
   Time: O(n)
   */
  
  func coolRob(_ nums: [Int]) -> Int {
    var robCurrent = 0
    var robPre = 0
    var robPrePre = 0
    for num in nums {
      robCurrent = max(robPre, robPrePre + num)
      robPrePre = robPre
      robPre = robCurrent
    }
    return robCurrent
  }
}
