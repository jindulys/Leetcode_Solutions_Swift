//
//  62_UniquePaths.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-12.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:62 Unique Paths
	URL: https://leetcode.com/problems/unique-paths/
	Space: O(mn)
	Time: O(mn)
 */

class UniquePaths_Solution {
  func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var pathsMatrix = Array(repeating: Array(repeating: 0, count: n), count: m)
    guard m > 1 || n > 1 else {
      return m * n
    }
    for i in 0..<m {
      for j in 0..<n {
        if i == 0 || j == 0 {
          pathsMatrix[i][j] = 1
        } else {
          pathsMatrix[i][j] = pathsMatrix[i][j - 1] + pathsMatrix[i - 1][j]
        }
      }
    }
    return pathsMatrix[m - 1][n - 1]
  }
}
