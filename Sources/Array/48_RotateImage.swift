//
//  48_RotateImage.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-07.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
 *        Transpose           Flip
 * 1 2 3             1 4 7             7 4 1
 * 4 5 6 ----------> 2 5 8 ----------> 8 5 2
 * 7 8 9             3 6 9             9 6 3
 */

/**
	Title:48 Rotate Image
	URL: https://leetcode.com/problems/rotate-image/
	Space: O(1)
	Time: O(n^2)
 */

class RotateImage_Solution {
  func rotate(_ matrix: inout [[Int]]) {
    for i in 0..<matrix.count {
      for j in i..<matrix.count {
        let tmp = matrix[i][j]
        matrix[i][j] = matrix[j][i]
        matrix[j][i] = tmp
      }
    }
    for i in 0..<matrix.count {
      for j in 0..<matrix.count/2 {
        let tmp = matrix[i][j]
        matrix[i][j] = matrix[i][matrix.count - 1 - j]
        matrix[i][matrix.count - 1 - j] = tmp
      }
    }
  }
}
