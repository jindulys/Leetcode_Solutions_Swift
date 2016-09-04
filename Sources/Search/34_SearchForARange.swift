//
//  34_SearchForARange.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-04.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:34 Search for a Range
	URL: https://leetcode.com/problems/search-for-a-range/
	Space: O(1)
	Time: O(lgn)
 */

class SearchForARange_Solution {
  func searchRange(nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 1 else {
      if nums.count == 1 {
        if nums[0] == target {
          return [0, 0]
        } else {
          return [-1, -1]
        }
      }
      return [-1, -1]
    }
    var start = 0
    var end = nums.count - 1
    // Firstly, find the last element that less than target.
    while start + 1 < end {
      let mid = start + (end - start) / 2
      if nums[mid] >= target {
        end = mid
      } else {
        start = mid
      }
    }
    var leftBound: Int = -1
    if nums[end] == target {
      leftBound = end
    }
    if nums[start] == target {
      leftBound = start
    }
    start = 0
    end = nums.count - 1
    // Secondly, find the first element that greater than target.
    while start + 1 < end {
      let mid = start + (end - start) / 2
      if nums[mid] <= target {
        start = mid
      } else {
        end = mid
      }
    }
    var rightBound: Int = -1
    if nums[start] == target {
      rightBound = start
    }
    if nums[end] == target {
      rightBound = end
    }
    return [leftBound, rightBound]
  }
}