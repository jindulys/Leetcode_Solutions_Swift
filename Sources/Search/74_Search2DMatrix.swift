//
//  74_Search2DMatrix.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-15.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

/**
 Title: 74 Search a 2D Matrix
 URL: https://leetcode.com/problems/search-a-2d-matrix/description/
 Space: O(m)
 Time: O(lgm + lgn)
 */

class Search2DMatrix {
  func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard matrix.count > 0 && matrix[0].count > 0 else {
      return false
    }
    var headArray: [Int] = []
    let m = matrix.count

    for i in 0..<m {
      headArray.append(matrix[i][0])
    }

    // Find the minimum row from where all elements are greater than target.
    let minimumIndexGreaterThanTarget = headArray.findMinimumIndex { $0 > target }
    var toExamine: [Int] = []
    if let rowIndex = minimumIndexGreaterThanTarget, rowIndex != 0 {
      // Our row should be the previous one if exists.
      toExamine = matrix[rowIndex - 1]
    } else if minimumIndexGreaterThanTarget == nil {
      // Or perhaps on the last row.
      toExamine = matrix[m - 1]
    }

    var start = 0
    var end = toExamine.count
    while start < end {
      let mid = start + (end - start) / 2
      if toExamine[mid] == target {
        return true
      } else if toExamine[mid] < target {
        start = mid + 1
      } else {
        end = mid
      }
    }

    return false
  }
}
