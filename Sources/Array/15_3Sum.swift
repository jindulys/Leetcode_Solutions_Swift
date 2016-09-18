//
//  15_3Sum.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-06.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:15 3Sum
	URL: https://leetcode.com/problems/3sum/
	Space: O(n)
	Time: O(n^2)
 */

class ThreeSum_Solution {
  func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else {
      return []
    }
    let nums = nums.sorted()
    var ret: [[Int]] = []
    for i in 0..<nums.count - 2 {
      // Skip repeated value, if we have computed it.
      // NOTE: we use i - 1 to skip those ones which have finished computing.
      if i - 1 >= 0 && nums[i] == nums[i - 1] {
        continue
      }
      // Two pointers.
      var left = i + 1
      var right = nums.count - 1
      while left < right {
        let sum = nums[i] + nums[left] + nums[right]
        if sum == 0 {
          ret.append([nums[i], nums[left], nums[right]])
          // NOTE: here we add 1 first, so that left will always be the one
          // we want to check. same for right.
          left += 1
          while left < right && nums[left] == nums[left - 1] {
            left += 1
          }
          right -= 1
          while right > left && nums[right] == nums[right + 1] {
            right -= 1
          }
        } else if (sum < 0) {
          left += 1
          while left < right && nums[left] == nums[left - 1] {
            left += 1
          }
        } else {
          right -= 1
          while left < right && nums[right] == nums[right + 1] {
            right -= 1
          }
        }
      }
    }
    return ret
  }
  
  func test() {
    let test1 = threeSum([-1, 0, 1, 2, -1, -4])
    print(test1)
  }
}
