//
//  303_RangeSumQuery.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:303 Range Sum Query - Immutable
	URL: https://leetcode.com/problems/range-sum-query-immutable/
	Space: O(N)
	Time: O(N)
 */

class RangeSumQuery_Solution {
  
  /// The sum array.
  var sumArray: [Int]?
  
  
  func queryWithArray(_ array: [Int], start: Int, end: Int) -> Int {
    guard array.count > 0 &&
      start >= 0 &&
      end <= array.count - 1 else {
      return 0
    }
    self.constructSumArray(array)
    if start == 0 {
      return self.sumArray![end]
    }
    return self.sumArray![end] - self.sumArray![start]
  }
  
  func constructSumArray(_ array: [Int]) {
    var computedArray = Array(repeating: 0, count: array.count)
    computedArray[0] = array[0]
    for i in 1..<array.count {
      computedArray[i] = computedArray[i - 1] + array[i]
    }
    // NOTE: sumArray means an array whose subscript value is the sum from 0th to ith.
    self.sumArray = computedArray
  }
  
  func test() {
    let result = self.queryWithArray([-2, 0, 3, -5, 2, -1], start: 0, end: 2)
    print(result)
  }
}
