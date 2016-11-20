//
//  75_SortColors.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-20.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:75 Sort Colors
	URL: https://leetcode.com/problems/sort-colors/
	Space: O(NlgN)
	Time: O(N)
 */

class SortColors_Solution {
  func sortColors(_ nums: inout [Int]) {
    mergeSort(&nums)
  }
  
  func mergeSort(_ nums: inout [Int]) {
    if nums.count == 1 {
      return
    }
    let mid = nums.count / 2
    var firstHalf = Array(nums.prefix(upTo: mid))
    var lastHalf = Array(nums.suffix(from: mid))
    mergeSort(&firstHalf)
    mergeSort(&lastHalf)
    
    let firstLength = firstHalf.count
    let lastLength = lastHalf.count
    
    var firstPos = 0
    var lastPos = 0
    var currentIndex = 0
    while firstPos <= firstLength - 1 && lastPos <= lastLength - 1 {
      if firstHalf[firstPos] <= lastHalf[lastPos] {
        nums[currentIndex] = firstHalf[firstPos]
        firstPos += 1
      } else {
        nums[currentIndex] = lastHalf[lastPos]
        lastPos += 1
      }
      currentIndex += 1
    }
    while firstPos <= firstLength - 1 {
      nums[currentIndex] = firstHalf[firstPos]
      firstPos += 1
      currentIndex += 1
    }
    while lastPos <= lastLength - 1 {
      nums[currentIndex] = lastHalf[lastPos]
      lastPos += 1
      currentIndex += 1
    }
  }
  
  func test() {
    var nums = [0, 1, 1, 2, 0]
    sortColors(&nums)
    print(nums)
  }
}
