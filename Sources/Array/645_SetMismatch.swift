//
//  645_SetMismatch.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-22.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

/**
 Title: 645 SetMismatch
 URL: https://leetcode.com/problems/set-mismatch/
 Space: O(N)
 Time: O(N)
 */

class SetMismatch {
  func findErrorNums(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else {
      return []
    }
    let n = nums.count
    var numsCount = Array(repeatElement(0, count: n))
    for i in 0..<n {
      numsCount[nums[i] - 1] += 1
    }
    var result = [-1, -1]
    for i in 0..<n {
      if numsCount[i] == 0 {
        result[1] = i + 1
      } else if numsCount[i] == 2 {
        result[0] = i + 1
      }
    }
    return result
  }
}
