//
//  212_WordSearchII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-20.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:212 Word Search II
	URL: https://leetcode.com/problems/word-search-ii/
	Space: O(N*3^N)
	Time: O(N^2)
 */

class WordSearchII_Solution {
  func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    guard board.count > 0 && words.count > 0 else {
      return []
    }
    let wordsTrie = Trie()
    for word in words {
      wordsTrie.insert(word: word)
    }
    var result: [String] = []
    let visitedBoard: [[Bool]] =
      Array(repeating: Array(repeating:false, count:board[0].count), count: board.count)
    for i in 0..<board.count {
      for j in 0..<(board[0].count) {
        dfs(rowIndex: i,
               colIndex: j,
               board: board,
               trie: wordsTrie,
               visitedBoard: visitedBoard,
               result: &result,
               trackedString: "")
      }
    }
    return result
  }
  
  func dfs(rowIndex: Int,
           colIndex: Int,
           board: [[Character]],
           trie: Trie,
           visitedBoard:[[Bool]],
           result: inout [String],
           trackedString: String) {
    let newCheckString = trackedString + String(board[rowIndex][colIndex])
    if !trie.isWordPrefix(prefix: newCheckString) {
      return
    }
    if trie.isWord(word: newCheckString) {
      if !result.contains(newCheckString) {
        result.append(newCheckString)
      }
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
      dfs(rowIndex: pos.0,
          colIndex: pos.1,
          board: board,
          trie: trie,
          visitedBoard: currentVisited,
          result: &result,
          trackedString: newCheckString)
    }
  }
}
