//
//  53_MaximumSubarry.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-14.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:53 Maximum Subarray
	URL: https://leetcode.com/problems/maximum-subarray/
	Space: O(n)
	Time: O(n)
 */

class MaximumSubarray_Solution {
  func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
      if nums.count == 1 {
        return nums[0]
      }
      return 0
    }
    var maxSums = Array(repeating: 0, count: nums.count)
    maxSums[0] = nums[0]
    var ret = nums[0]
    for i in 1..<nums.count {
      maxSums[i] = (maxSums[i - 1] > 0 ? maxSums[i - 1] : 0) + nums[i]
      ret = max(ret, maxSums[i])
    }
    return ret
  }
}
