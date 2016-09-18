//
//  162_FindAPeakElement.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-03.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:162 Find Peak Element
	URL: https://leetcode.com/problems/find-peak-element/
	Space: O(1)
	Time: O(lgn)
 */

class FindPeakElement_Solution {
  // My solution loop through.
  func MyfindPeakElement(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
      return nums.count == 1 ? 0 : -1
    }
    if nums[0] > nums[1]{
      return 0
    }
    if nums[nums.count - 1] > nums[nums.count - 2] {
      return nums.count - 1
    }
    for i in 1..<nums.count - 1 {
      if nums[i] > nums[i - 1] && nums[i] > nums[i + 1] {
        return i
      }
    }
    return -1
  }
  
  func findPeakElement(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
      return nums.count == 1 ? 0 : -1
    }
    var left = 0
    var right = nums.count - 1
    while left + 1 < right {
      let mid = left + (right - left) / 2
      if nums[mid] > nums[mid - 1] && nums[mid] > nums[mid + 1] {
        return mid
      }
      if nums[mid] > nums[mid + 1] {
        right = mid
      } else {
        left = mid
      }
    }
    if nums[left] > nums[right] {
      return left
    } else {
      return right
    }
  }
}
