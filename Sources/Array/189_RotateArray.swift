//
//  189_RotateArray.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-28.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:189 Rotate Array
	URL: https://leetcode.com/problems/rotate-array/
	Space: O(1)
	Time: O(n)
 */

class RotateArray_Solution {
  func rotate(_ nums: inout [Int], _ k: Int) {
    let k = k % nums.count
    reverse(&nums, startIndex: 0, endIndex: nums.count - 1)
    reverse(&nums, startIndex: 0, endIndex: k - 1)
    reverse(&nums, startIndex: k, endIndex: nums.count - 1)
  }
  
  func reverse(_ nums: inout [Int], startIndex: Int, endIndex: Int) {
    if startIndex < 0 || endIndex >= nums.count || startIndex >= endIndex {
      return
    }
    var currentStartIndex = startIndex
    var currentEndIndex = endIndex
    while currentStartIndex < currentEndIndex {
      let tmp = nums[currentEndIndex]
      nums[currentEndIndex] = nums[startIndex]
      nums[startIndex] = tmp
      currentEndIndex -= 1
      currentStartIndex += 1
    }
  }
  
  func test() {
    var testArray = [1, 2, 3, 4, 5, 6, 7]
    rotate(&testArray, 3)
    print(testArray)
    testArray = [1, 2, 3, 4, 5, 6]
    rotate(&testArray, 2)
    print(testArray)
    testArray = [1, 2]
    rotate(&testArray, 1)
    print(testArray)
  }
}
