//
//  90_SubSetsII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-16.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:90 Subsets II
	URL: https://leetcode.com/problems/subsets-ii/
	Space: O(2^N)
	Time: O(2^N)
*/

class SubSetII_Solution {
  func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 {
      return []
    }
    var result: [[Int]] = []
    result.append([])
    let newNums = nums.sorted()
    generateSubsetsWith(result: &result, currentSubSet: [], startIndex: 0, nums: newNums)
    return result
  }
  
  func generateSubsetsWith(result: inout [[Int]],
                           currentSubSet: [Int],
                           startIndex: Int,
                           nums: [Int]) {
    for i in startIndex..<nums.count {
      // NOTE: key point here is i != startIndex, if i == startIndex we only want to be included once and only once.
      if (i > 0 && nums[i] == nums[i - 1] && i != startIndex) {
        continue
      }
      var newSubSet = currentSubSet
      newSubSet.append(nums[i])
      result.append(newSubSet)
      generateSubsetsWith(result: &result,
                          currentSubSet: newSubSet,
                          startIndex: i + 1,
                          nums: nums)
    }
  }
}
