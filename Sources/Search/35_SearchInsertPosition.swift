//
//  35_SearchInsertPosition.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-04.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:35 Search Insert Position
	URL: https://leetcode.com/problems/search-insert-position/
	Space: O(1)
	Time: O(lgn)
 */

class SearchInsertPosition_Solution {
  func searchInsert(nums: [Int], _ target: Int) -> Int {
    guard nums.count > 1 else {
      if nums.count == 1 {
        if nums[0] > target {
          return 0
        } else if nums[0] == target {
          return 0
        } else {
          return 1
        }
      } else {
        return 0
      }
    }
    var start = 0
    var end = nums.count - 1
    while start + 1 < end {
      let mid = start + (end - start) / 2
      if nums[mid] == target {
        return mid
      }
      if nums[mid] > target {
        end = mid
      } else {
        start = mid
      }
    }
    if nums[start] == target {
      return start
    }
    if nums[end] == target {
      return end
    }
    if nums[start] > target {
      return start
    }
    if nums[start] < target && nums[end] > target {
      return start + 1
    }
    if nums[end] < target {
      return end + 1
    }
    return -1
  }
}