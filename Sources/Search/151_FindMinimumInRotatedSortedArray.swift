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
  func findMin(nums: [Int]) -> Int {
    guard nums.count > 1 else {
      return nums.count == 1 ? nums[0] : -1
    }
    var left = 0
    var right = nums.count - 1
    while left + 1 < right {
      let mid = left + (right - left) / 2
      if nums[mid] > nums[left] && nums[mid] > nums[right] {
        left = mid
      } else if nums[mid] > nums[left] && nums[mid] < nums[right] {
        right = mid
      } else if nums[mid] < nums[left] {
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