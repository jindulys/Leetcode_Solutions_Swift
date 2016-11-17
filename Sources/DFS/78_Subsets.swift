//
//  78_Subsets.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-16.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:78 Subsets
	URL: https://leetcode.com/problems/subsets/
	Space: O(2^N)
	Time: O(2^N)
*/

class SubSets_Solution {
  func subsets(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 {
      return []
    }
    var result: [[Int]] = [[]]
    generateSubSets(result: &result,
                    currentSubSet: [],
                    startIndex: 0,
                    nums: nums)
    return result
  }
  
  // Why we need startIndex, because it is a [1, 2] and [2, 1] is the same,
  // we need a way to guarantee that the way we choose element is irreversible.
  func generateSubSets(result: inout [[Int]],
                       currentSubSet: [Int],
                       startIndex: Int,
                       nums: [Int]) {
    if startIndex == nums.count {
      return
    }
    for i in startIndex..<nums.count {
      var newSubSet = currentSubSet
      newSubSet.append(nums[i])
      result.append(newSubSet)
      generateSubSets(result: &result, currentSubSet: newSubSet, startIndex: i + 1, nums: nums)
    }
  }
}
