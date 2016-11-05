//
//  80_RemoveDuplicatesFromSortedArrayII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:80 Remove Duplicates from sorted array II
	URL: https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
	Space: O(N)
	Time: O(N)
 */

class RemoveDuplicatesFromSortedArrayII_Solution {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    let totalCount = nums.count
    guard totalCount > 2 else {
      return totalCount
    }
    
    // This time we need to treat the first item differently.
    var currentRepeatTolerance = 0
    var lastFoundValidElementIndex = -1
    var lastValidElement = nums[0]

    for num in nums {
      if num != lastValidElement {
        lastFoundValidElementIndex += 1
        nums[lastFoundValidElementIndex] = num
        currentRepeatTolerance = 1
        lastValidElement = num
      } else if currentRepeatTolerance < 2 {
        lastFoundValidElementIndex += 1
        nums[lastFoundValidElementIndex] = num
        currentRepeatTolerance += 1
      }
    }
    return lastFoundValidElementIndex + 1
  }
  
  func brilliantSolution(_ nums: inout [Int]) -> Int {
    var lastValidIndex = 0
    for num in nums {
      if lastValidIndex < 2 || num > nums[lastValidIndex - 2] {
        nums[lastValidIndex] = num
        lastValidIndex += 1
      }
    }
    return lastValidIndex
  }
}
