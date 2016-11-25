//
//  377_CombinationSumIV.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-24.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:377 Combination Sum IV
	URL: https://leetcode.com/problems/combination-sum-iv/
	Space: O(n^(target/min(n)))
	Time: O(N)
 */

class CombinationSumIV_Solution {
  // NOTE: For this solution I will use memoization way.
  func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else {
      return 0
    }
    let sortedNums = nums.sorted()
    let minElement = sortedNums[0]
    let combinationFunction: (Int) -> Int = memoize { (combinationFunction, x) -> Int in
      if x == 0 {
        return 1
      }
      if x < minElement {
        return 0
      }
      var result: Int = 0
      for current in nums {
        if combinationFunction(x - current) != -1 {
          result += combinationFunction(x - current)
        }
      }
      return result
    }
    return combinationFunction(target)
  }
  
  func test() {
    let result = combinationSum4([1, 2, 3], 4)
    print(result)
  }
}
