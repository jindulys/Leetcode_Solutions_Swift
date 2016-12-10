//
//  64_MinimumPathSum.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-12-10.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:64 Minimum Path Sum
	URL: https://leetcode.com/problems/minimum-path-sum/
	Space: O(mn)
	Time: O(mn)
 */

class MinimumPathSum_Solution {
  func minPathSum(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else {
      return 0
    }
    let m = grid.count
    let n = grid[0].count
    // NOTE: minimumGrid means the minimum path sum at point (i, j).
    var minimumGird =
        Array(repeating: Array(repeating: Int.max, count: n), count: m)
    minimumGird[0][0] = grid[0][0]
    for j in 1..<n {
      minimumGird[0][j] = minimumGird[0][j - 1] + grid[0][j]
    }
    for i in 1..<m {
      minimumGird[i][0] = minimumGird[i - 1][0] + grid[i][0]
    }
    for i in 1..<m {
      for j in 1..<n {
        minimumGird[i][j] = min(minimumGird[i - 1][j], minimumGird[i][j - 1]) + grid[i][j]
      }
    }
    return minimumGird[m - 1][n - 1]
  }
}
