//
//  213_HouseRobberII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-16.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

class HouseRobberII_Solution {
  func rob(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
      if nums.count == 1 {
        return nums[0]
      } else {
        return 0
      }
    }
    let robFirst = robHelper(nums, left: 0, right: nums.count - 2)
    let robLast = robHelper(nums, left: 1, right: nums.count - 1)
    return max(robFirst, robLast)
  }
  
  /// rob a row of house with \a left, \a right.
  func robHelper(_ nums: [Int], left: Int, right: Int) -> Int {
    guard nums.count > 0 &&
      left <= right &&
      left >= 0 &&
      right <= nums.count - 1 else {
      return 0
    }
    // NOTE: The maximum value by robbing current room.
    var robCurrentRoom = Array(repeating: 0, count: right - left + 1)
    for i in left...right {
      if i == left {
        robCurrentRoom[i - left] = nums[i]
      } else if i == left + 1 {
        robCurrentRoom[i - left] = max(nums[i - 1], nums[i])
      } else {
        robCurrentRoom[i - left]
          = max(robCurrentRoom[i - left - 2] + nums[i], robCurrentRoom[i - left - 1])
      }
    }
    return robCurrentRoom[right - left]
  }
}
