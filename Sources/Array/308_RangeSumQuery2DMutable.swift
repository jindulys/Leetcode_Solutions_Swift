//
//  308_RangeSumQuery2DMutable.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:308 Range Sum Query 2D - Mutable
	URL: https://leetcode.com/problems/range-sum-query-2d-mutable/
	Space: O(N^2)
	Time: O(N^2)
 */

final class Range2DSumQueryMutable_Solution: Solution {
  var sumMatrix: [[Int]]?
  var keptMatrix: [[Int]]?
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
    self.keptMatrix = array
    if self.sumMatrix == nil {
      self.constructSumMatrix(array: array)
    }
    let topRightSum = sumMatrix![startRow][endCol + 1]
    let bottomLeft = sumMatrix![endRow + 1][startCol]
    let commonPart = sumMatrix![startRow][startCol]
    let total = sumMatrix![endRow + 1][endCol + 1]
    return total - topRightSum - bottomLeft + commonPart
  }
  
  func queryWith(startRow: Int,
                 startCol: Int,
                 endRow: Int,
                 endCol: Int) -> Int {
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
        computedSumMatrix[i][j] =
          computedSumMatrix[i - 1][j] +
          computedSumMatrix[i][j - 1] -
          computedSumMatrix[i - 1][j - 1] +
          array[i - 1][j - 1]
      }
    }
    self.sumMatrix = computedSumMatrix
  }
  
  func updateMatrixWith(value: Int, row: Int, col: Int) {
    guard var keptMatrix = self.keptMatrix,
      var sumMatrix = self.sumMatrix,
      (row >= 0 &&
      row < keptMatrix.count &&
      col >= 0 &&
      col < keptMatrix[0].count) else {
      return
    }
    let changed = value - keptMatrix[row][col]
    for i in (row + 1)..<sumMatrix.count {
      for j in (col + 1)..<sumMatrix[0].count {
        sumMatrix[i][j] += changed
      }
    }
    keptMatrix[row][col] = value
    self.keptMatrix = keptMatrix
    self.sumMatrix = sumMatrix
  }
  
  override func test() {
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
    self.updateMatrixWith(value: 2, row: 3, col: 2)
    let newResult = self.queryWith(startRow: 2,
                                   startCol: 1,
                                   endRow: 4,
                                   endCol: 3)
    print(newResult)
  }
}
