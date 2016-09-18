//
//  151_FindMinimumInRotatedSortedArray.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-03.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:153 Find Minimum in Rotated Sorted Array
	URL: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
	Space: O(1)
	Time: O(lgn)
 */

class FindMinimumInRotatedSortedArray_Solution {
  // Set the right most element as this rotated sorted array's target.
  // Then we want to find the first element that less that right most element.
  func findMin(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
      return nums.count == 1 ? nums[0] : -1
    }
    var left = 0
    var right = nums.count - 1
    let target = nums[right]
    while left + 1 < right {
      let mid = left + (right - left) / 2
      if nums[mid] > target {
        left = mid
      } else {
        right = mid
      }
    }
    if nums[left] > nums[right] {
      return nums[right]
    } else {
      return nums[left]
    }
  }
}
