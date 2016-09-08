//
//  228_SummaryRange.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-07.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:228 Summary Ranges
	URL: https://leetcode.com/problems/summary-ranges/
	Space: O(n)
	Time: O(n)
 */

class SummaryRanges_Solution {
  func summaryRanges(nums: [Int]) -> [String] {
    guard nums.count > 0 else {
      return []
    }
    var startIndex = 0
    var walkingIndex = startIndex
    var ret: [String] = []
    while walkingIndex < nums.count {
      if (walkingIndex + 1 < nums.count &&
      nums[walkingIndex] + 1 != nums[walkingIndex + 1]) ||
        walkingIndex == nums.count - 1 {
        if walkingIndex == startIndex {
          ret.append("\(nums[startIndex])")
        } else {
          ret.append("\(nums[startIndex])->\(nums[walkingIndex])")
        }
        startIndex = walkingIndex + 1
      }
      walkingIndex += 1
    }
    return ret
  }
}