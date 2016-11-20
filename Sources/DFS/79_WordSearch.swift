//
//  79_WordSearch.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-19.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:79 Word Search
	URL: https://leetcode.com/problems/word-search/
	Space: O(3^N)
	Time: O(N^2)
 */

class WordSearch_Solution {
  func exist(_ board: [[Character]], _ word: String) -> Bool {
    guard board.count > 0 && board.count * board[0].count >= word.characters.count else {
      return false
    }
    guard word.characters.count > 0 else {
      return true
    }
    let visitedBoard: [[Bool]] =
        Array(repeating: Array(repeating:false, count:board[0].count), count: board.count)
    let word: [Character] = Array(word.characters)
    for i in 0..<board.count {
      for j in 0..<(board[0].count) {
        if dfs(rowIndex: i,
               colIndex: j,
               board: board,
               word: word,
               currentIndex: 0,
               visitedBoard: visitedBoard) {
          return true
        }
      }
    }
    return false
  }
  
  func dfs(rowIndex: Int,
           colIndex: Int,
           board: [[Character]],
           word: [Character],
           currentIndex: Int,
           visitedBoard:[[Bool]]) -> Bool {
    if board[rowIndex][colIndex] != word[currentIndex] {
      return false
    }
    if currentIndex == word.count - 1 {
      return true
    }
    var potentioalNextStep: [(Int, Int)] = []
    if rowIndex < board.count - 1 && visitedBoard[rowIndex + 1][colIndex] == false {
      potentioalNextStep.append((rowIndex + 1, colIndex))
    }
    if rowIndex > 0 && visitedBoard[rowIndex - 1][colIndex] == false {
      potentioalNextStep.append((rowIndex - 1, colIndex))
    }
    if colIndex < board[0].count - 1 && visitedBoard[rowIndex][colIndex + 1] == false {
      potentioalNextStep.append((rowIndex, colIndex + 1))
    }
    if colIndex > 0 && visitedBoard[rowIndex][colIndex - 1] == false {
      potentioalNextStep.append((rowIndex, colIndex - 1))
    }
    var currentVisited = visitedBoard
    currentVisited[rowIndex][colIndex] = true
    for pos in potentioalNextStep {
      if dfs(rowIndex: pos.0,
             colIndex: pos.1,
             board: board,
             word: word,
             currentIndex: currentIndex + 1,
             visitedBoard: currentVisited) {
        return true
      }
    }
    return false
  }
  func test() {
    let l1 = "aaaa"
    let l2 = "aaaa"
    let l3 = "aaaa"
    let l4 = "aaaa"
    let l5 = "aaab"
    let board = [Array(l1.characters), Array(l2.characters),Array(l3.characters), Array(l4.characters),Array(l5.characters)]
    let toFind = "aaaaaaaaaaaaaaaaaaaa"
    if exist(board, toFind) {
      print("Exist")
    } else {
      print("Not Exist")
    }
  }
}
