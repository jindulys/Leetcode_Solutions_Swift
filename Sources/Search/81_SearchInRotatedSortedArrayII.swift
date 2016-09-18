//
//  81_SearchInRotatedSortedArrayII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-03.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title: 81 Search in rotated sorted array II
	URL: https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
	Space: O(1)
	Time: O(n)
 */

class SearchInRotatedSortedArrayII_Solution {
  func search(_ nums: [Int], _ target: Int) -> Bool {
    guard nums.count > 1 else {
      return nums.count == 1 ? (nums[0] == target ? true : false ) : false
    }
    var left = 0
    var right = nums.count - 1
    while left + 1 < right {
      let mid = left + (right - left) / 2
      if nums[mid] == target {
        return true
      }
      if nums[mid] > nums[left] {
        // Note: target should take care of equaling to left situation.
        if target < nums[mid] && target >= nums[left] {
          right = mid
        } else {
          left = mid
        }
      } else if nums[mid] < nums[left] {
        if target > nums[mid] && target <= nums[right] {
          left = mid
        } else {
          right = mid
        }
      } else {
        left += 1
      }
    }
    if nums[left] == target {
      return true
    }
    if nums[right] == target {
      return true
    }
    return false
  }
  
  func test() {
    let testArray = [1, 1, 1, 1, 1, 1, 1, 1,
                     1, 1, 1, 1, 1, 1, 1, 1,
                     1, 1, 3, 1, 1, 1, 1, 1]
    search(testArray, 3)
  }
}
