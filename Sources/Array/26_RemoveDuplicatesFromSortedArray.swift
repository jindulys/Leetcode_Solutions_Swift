//
//  26_RemoveDuplicatesFromSortedArray.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:26 Remove Duplicates from sorted array
	URL: https://leetcode.com/problems/remove-duplicates-from-sorted-array/
	Space: O(N)
	Time: O(N)
 */

class RemoveDuplicatesFromSortedArray_Solution {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else {
      return nums.count
    }

    var lastFoundUnrepeatedIndex = 0
    // Add in a local tmp to reduce array index query and improve performance.
    var currentComparisonElement = nums[lastFoundUnrepeatedIndex]
    for num in nums {
      if num != currentComparisonElement {
        lastFoundUnrepeatedIndex += 1
        nums[lastFoundUnrepeatedIndex] = num
        currentComparisonElement = num
      }
    }
    return lastFoundUnrepeatedIndex + 1
  }
}
