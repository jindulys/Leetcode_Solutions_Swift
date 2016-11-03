//
//  18_4Sum.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-02.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:18 4 Sum
	URL: https://leetcode.com/problems/4sum/
	Space: O(N^2)
	Time: O(N^4)
 */

class FourSum_Solution {
  func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard nums.count > 3 else {
      return []
    }
    let nums = nums.sorted()
    var ret: [[Int]] = []
    for i in 0..<nums.count - 3 {
      if i - 1 >= 0 && nums[i] == nums[i - 1] {
        continue
      }
      var left = i + 1
      while left < nums.count - 2 {
        var leftMiddle: Int = left + 1
        var right = nums.count - 1
        while leftMiddle < right {
          if nums[i] + nums[left] + nums[leftMiddle] + nums[right] == target {
            ret.append([nums[i], nums[left], nums[leftMiddle], nums[right]])
            leftMiddle += 1
            while leftMiddle < right && nums[leftMiddle] == nums[leftMiddle - 1] {
              leftMiddle += 1
            }
            right -= 1
            while leftMiddle < right && nums[right] == nums[right + 1] {
              right -= 1
            }
          } else if nums[i] + nums[left] + nums[leftMiddle] + nums[right] < target {
            leftMiddle += 1
            while leftMiddle < right && nums[leftMiddle] == nums[leftMiddle - 1] {
              leftMiddle += 1
            }
          } else {
            right -= 1
            while leftMiddle < right && nums[right] == nums[right + 1] {
              right -= 1
            }
          }
        }
        left += 1
        while left < nums.count - 1 && nums[left] == nums[left - 1] {
          left += 1
        }
      }
    }
    return ret
  }
  
  func test() {
    let result = fourSum([-1, -5, -5, -3, 2, 5, 0, 4], -7)
    print(result)
  }
}
