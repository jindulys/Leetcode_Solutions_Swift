//
//  300_LongestIncreasingSubsequence.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-12-10.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:300 Longest Increasing Subsequence
	URL: https://leetcode.com/problems/longest-increasing-subsequence/
	Space: O(n)
	Time: O(n^2)
 */

class LongestIncreasingSubSequence_Solution {
  func lengthOfLIS(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
      return 0
    }
    let m = nums.count
    var longestSubSequenceCounts = Array(repeating: 1, count: m)
    for i in 0..<m {
      for j in 0..<i {
        if nums[j] < nums[i] {
          longestSubSequenceCounts[i] =
              max(longestSubSequenceCounts[j] + 1, longestSubSequenceCounts[i])
        }
      }
    }
    return longestSubSequenceCounts.max()!
  }
}
