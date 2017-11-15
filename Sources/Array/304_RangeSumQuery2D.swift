//
//  304_RangeSumQuery2D.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:304 Range Sum Query 2D - Immutable
	URL: https://leetcode.com/problems/range-sum-query-2d-immutable/
	Space: O(N^2)
	Time: O(N^2)
 */

class Range2DSumQuery_Solution {
  var sumMatrix: [[Int]]?
  func queryWithArray(_ array: [[Int]],
                      startRow: Int,
                      startCol: Int,
                      endRow: Int,
                      endCol: Int) -> Int {
    guard array.count > 0 &&
      startRow < endRow &&
      startCol < endCol &&
      startRow >= 0 &&
      endRow < array.count &&
      startCol >= 0 &&
      endCol < array[0].count else {
      return 0
    }
    self.constructSumMatrix(array: array)
    let topRightSum = sumMatrix![startRow][endCol + 1]
    let bottomLeft = sumMatrix![endRow + 1][startCol]
    let commonPart = sumMatrix![startRow][startCol]
    let total = sumMatrix![endRow + 1][endCol + 1]
    return total - topRightSum - bottomLeft + commonPart
  }
  
  func constructSumMatrix(array: [[Int]]) {
    var computedSumMatrix =
      Array(repeating: Array(repeating: 0, count:array[0].count + 1), count: array.count + 1)
    for i in 1..<array.count + 1 {
      for j in 1..<array[0].count + 1 {
        let part1 = computedSumMatrix[i - 1][j] +
          computedSumMatrix[i][j - 1]
        let part2 = computedSumMatrix[i - 1][j - 1] +
          array[i - 1][j - 1]
        computedSumMatrix[i][j] = part1 - part2

      }
    }
    self.sumMatrix = computedSumMatrix
  }
  
  func test() {
    let result = self.queryWithArray([[3, 0, 1, 4, 2],
                         [5, 6, 3, 2, 1],
                         [1, 2, 0, 1, 5],
                         [4, 1, 0, 1, 7],
                         [1, 0, 3, 0, 5]],
                        startRow: 2,
                        startCol: 1,
                        endRow: 4,
                        endCol: 3)
    print(result)
  }
}
