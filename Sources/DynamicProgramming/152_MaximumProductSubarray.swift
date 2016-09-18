//
//  152_MaximumProductSubarray.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-18.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:152 Maximum Product Subarray
	URL: https://leetcode.com/problems/maximum-product-subarray/
	Space: O(1)
	Time: O(n)
 */

class MaximumProductSubArray_Solution {
  func maxProduct(_ nums: [Int]) -> Int {
    var ret = nums[0]
    // Maximum product at index `i`.
    var iMax = nums[0]
    // Minimum product at index `i`.
    var iMin = nums[0]
    for i in 1..<nums.count {
      if nums[i] < 0 {
        swap(&iMax, &iMin)
      }
      // To skip 0 case
      iMax = max(nums[i], nums[i] * iMax)
      // To skip 0 case
      iMin = min(nums[i], nums[i] * iMin)
      ret = max(iMax, ret)
    }
    return ret
  }
}
