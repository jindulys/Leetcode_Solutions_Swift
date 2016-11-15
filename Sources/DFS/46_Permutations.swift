//
//  46_Permutations.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-14.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:46 Permutations
	URL: https://leetcode.com/problems/permutations/
	Space: O(N!)
	Time: O(N!)
 */

class Permutation_Solution {
  func permute(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else {
      return []
    }
    var result: [[Int]] = []
    traversePermutationWithResults(result: &result,
                                   currentPermutation: [],
                                   currentSet: [],
                                   nums: nums)
    return result
  }
  
  // MARK: - Private
  func traversePermutationWithResults(result: inout [[Int]],
                                      currentPermutation: [Int],
                                      currentSet: Set<Int>,
                                      nums: [Int]) {
    // We have find a result append it.
    if currentPermutation.count == nums.count {
      result.append(currentPermutation)
      return
    }
    for i in nums {
      if currentSet.contains(i) {
        continue
      }
      let nextPermutation = currentPermutation + [i]
      var nextSet = currentSet
      nextSet.insert(i)
      traversePermutationWithResults(result: &result,
                                     currentPermutation: nextPermutation,
                                     currentSet: nextSet,
                                     nums: nums)
    }
  }
}
