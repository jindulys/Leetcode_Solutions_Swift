//
//  39_ValidSudoku.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-31.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:36 Valid Sudoku
	URL: https://leetcode.com/problems/valid-sudoku/
	Space: O(1)
	Time: O(1)
 */

class ValidSudoku_Solution {
  func isValidSudoku(board: [[Character]]) -> Bool {
    let emptyArray = Array(count: 9, repeatedValue: 0)
    var rowCheck = Array(count: 9, repeatedValue: emptyArray)
    var colCheck = Array(count: 9, repeatedValue: emptyArray)
    var blockCheck = Array(count: 9, repeatedValue: emptyArray)
    for i in 0..<9 {
      for j in 0..<9 {
        let currentCharacter = board[i][j]
        if let currentElement = Int(String(currentCharacter)) {
          if rowCheck[i][currentElement - 1] != 0 {
            return false
          } else {
            rowCheck[i][currentElement - 1] = 1
          }
          if colCheck[j][currentElement - 1] != 0 {
            return false
          } else {
            colCheck[j][currentElement - 1] = 1
          }
          if blockCheck[(i/3) * 3 + j/3][currentElement - 1] != 0 {
            return false
          } else {
            blockCheck[(i/3) * 3 + j/3][currentElement - 1] = 1
          }
        }
      }
    }
    return true
  }
}