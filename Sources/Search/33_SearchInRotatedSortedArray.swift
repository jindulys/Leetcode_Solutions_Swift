//
//  33_SearchInRotatedSortedArray.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-03.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:33 Search in rotated sorted array
	URL: https://leetcode.com/problems/search-in-rotated-sorted-array/
	Space: O(1)
	Time: O(lgn)
 */

class RotatedSortedArray_Solution {
  func search(nums: [Int], _ target: Int) -> Int {
    guard nums.count > 1 else {
      return nums.count == 1 ? (nums[0] == target ? 0 : -1 ) : -1
    }
    var left = 0
    var right = nums.count - 1
    while left + 1 < right {
      let mid = left + (right - left) / 2
      if nums[mid] == target {
        return mid
      }
      if nums[mid] > nums[left] {
        // Note: target should take care of equaling to left situation.
        if target < nums[mid] && target >= nums[left] {
          right = mid
        } else {
          left = mid
        }
      } else {
        if target > nums[mid] && target <= nums[right] {
          left = mid
        } else {
          right = mid
        }
      }
    }
    if nums[left] == target {
      return left
    }
    if nums[right] == target {
      return right
    }
    return -1
  }
}