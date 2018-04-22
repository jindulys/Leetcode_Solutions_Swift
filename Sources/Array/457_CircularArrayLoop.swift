//
//  457_CircularArrayLoop.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-21.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

/**
 Title: 457 Circular Array Loop
 URL: https://leetcode.com/problems/circular-array-loop
 Space: O(1)
 Time: O(N)
 */
class CircularArrayLoop {
  func circularArrayLoop(_ nums: [Int]) -> Bool {
    guard nums.count > 0 else {
      return false
    }
    var checkingNums = nums
    let n = nums.count
    for i in 0..<n {
      if checkingNums[i] == 0 {
        continue
      }
      // Slow pointer
      var j = i
      // Fast pointer
      var k = getNextIndex(i, nums: nums)
      // While we are in the same direction, continue checking.
      while checkingNums[k] * checkingNums[i] > 0 &&
        checkingNums[getNextIndex(k, nums: nums)] * checkingNums[i] > 0 {
          if j == k {
            // Single node loop is not what we want.
            if j == getNextIndex(j, nums: nums) {
              break
            }
            return true
          }
          j = getNextIndex(j, nums: nums)
          k = getNextIndex(k, nums: nums, repeated: 2)
      }
      j = i
      let val = checkingNums[i]
      while checkingNums[j] * val > 0 {
        // Clean up all the info that on the same direction.
        let next = getNextIndex(j, nums: nums)
        checkingNums[j] = 0
        j = next
      }
    }
    return false
  }

  func getNextIndex(_ i: Int, nums: [Int], repeated: Int = 1) -> Int {
    let n = nums.count
    var cal = i
    if repeated > 1 {
      cal = getNextIndex(i, nums: nums, repeated: repeated - 1)
    }
    return cal + nums[cal] >= 0 ? (cal + nums[cal]) % n : n + (cal + nums[cal]) % n
  }
}
