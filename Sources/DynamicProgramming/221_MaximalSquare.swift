//
//  221_MaximalSquare.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-18.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

class MaximalSquare_Solution {
  /**
   Title:221 Maximal Square
   URL: https://leetcode.com/problems/maximal-square/
   Space: O(MN)
   Time: O(MN)
   */
  func maximalSquare(_ matrix: [[Int]]) -> Int {
    guard matrix.count > 0, matrix[0].count > 0 else {
      return 0
    }
    var ret: Int = Int.min
    let rowCount = matrix.count
    let colCount = matrix[0].count
    var sizeMatrix = Array(repeating: Array(repeating:0, count: colCount), count: rowCount)
    for i in 0..<colCount {
      sizeMatrix[0][i] = matrix[0][i] == 1 ? 1 : 0
    }
    for i in 0..<rowCount {
      sizeMatrix[i][0] = matrix[i][0] == 1 ? 1 : 0
    }
    for i in 1..<rowCount {
      for j in 1..<colCount {
        if matrix[i][j] == 0 {
          sizeMatrix[i][j] = 0
        } else {
          sizeMatrix[i][j] = min(sizeMatrix[i - 1][j], sizeMatrix[i][j - 1], sizeMatrix[i - 1][j - 1]) + 1
          ret = max(ret, sizeMatrix[i][j])
        }
      }
    }
    return ret * ret
  }
  
  func test() {
    let test1: [[Int]] = [[1,0,1,0,0],
                                [1,0,1,1,1],
                                [1,1,1,1,1],
                                [1,0,0,1,0]]
    let ret = maximalSquare(test1)
    if ret == 4 {
      print("Maximal Square Passed")
    } else {
      print("Maximal Square Failed")
    }
  }
}
