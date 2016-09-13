//
//  63_UniquePaths.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-12.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:63 Unique Paths II
	URL: https://leetcode.com/problems/unique-paths-ii/
	Space: O(mn)
	Time: O(mn)
 */

class UniquePathsII_Solution {
  func uniquePathsWithObstacles(obstacleGrid: [[Int]]) -> Int {
    let m = obstacleGrid.count
    let n = obstacleGrid[0].count
    guard m > 1 || n > 1 else {
      if obstacleGrid[m - 1][n - 1] == 1 {
        return 0
      } else {
        return 1
      }
    }
    var pathsMatrix = Array(count: m, repeatedValue: Array(count: n, repeatedValue: 0))
    for i in 0..<m {
      for j in 0..<n {
        if i == 0 || j == 0 {
          if i > 0 && pathsMatrix[i - 1][j] == 0 ||
            obstacleGrid[i][j] == 1 ||
            (j > 0 && pathsMatrix[i][j - 1] == 0) {
            pathsMatrix[i][j] = 0
          } else {
            pathsMatrix[i][j] = 1
          }
        } else {
          if obstacleGrid[i][j] == 1 {
            pathsMatrix[i][j] = 0
          } else {
            pathsMatrix[i][j] = pathsMatrix[i][j - 1] + pathsMatrix[i - 1][j]
          }
        }
      }
    }
    return pathsMatrix[m - 1][n - 1]
  }
}