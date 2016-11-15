//
//  47_PermutationsII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-14.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:47 Permutations II
	URL: https://leetcode.com/problems/permutations-ii/
	Space: O(N!)
	Time: O(N!)
 */

class PermutationsII_Solution {
  func permuteUnique(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else {
      return []
    }
    var result: [[Int]] = []
    let sortedNum = nums.sorted()
    let visited = Array(repeating: false, count: nums.count)
    traversePermutationWithResults(result: &result,
                                   currentPermutation: [],
                                   visited: visited,
                                   nums: sortedNum)
    return result
  }
  
  // MARK: - Private
  func traversePermutationWithResults(result: inout [[Int]],
                                      currentPermutation: [Int],
                                      visited: [Bool],
                                      nums: [Int]) {
    // We have find a result append it.
    if currentPermutation.count == nums.count {
      result.append(currentPermutation)
      return
    }
    for i in 0..<nums.count {
      if visited[i] == true || (i > 0 && nums[i] == nums[i - 1] && visited[i - 1]) {
        continue
      }
      let nextPermutation = currentPermutation + [nums[i]]
      var nextVisited = visited
      nextVisited[i] = true
      traversePermutationWithResults(result: &result,
                                     currentPermutation: nextPermutation,
                                     visited: nextVisited,
                                     nums: nums)
    }
  }
  
  func test() {
    let nums = [1,1, 1, 2]
    let ret = self.permuteUnique(nums)
    print(ret)
  }
}
