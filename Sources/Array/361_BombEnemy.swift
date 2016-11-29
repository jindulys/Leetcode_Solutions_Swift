//
//  361_BombEnemy.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

class BombEnemySolution {
  func maxKilledEnemies(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else {
      return 0
    }
    let rowCount = grid.count
    let colCount = grid[0].count
    var rowMetrix: [[Int]] = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    var colMetrix: [[Int]] = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    
    // Generate rowMetrix.
    for i in 0..<rowCount {
      var emptyIndexes: [Int] = []
      var currentEnemies = 0
      for j in 0..<colCount {
        if grid[i][j] == "0" {
          emptyIndexes.append(j)
        } else if grid[i][j] == "E" {
          currentEnemies += 1
        } else if grid[i][j] == "W" {
          for col in emptyIndexes {
            rowMetrix[i][col] = currentEnemies
          }
          emptyIndexes = []
          currentEnemies = 0
        }
      }
      for col in emptyIndexes {
        rowMetrix[i][col] = currentEnemies
      }
    }
    
    // Generate colMetrix.
    for j in 0..<colCount {
      var emptyIndexes: [Int] = []
      var currentEnemies = 0
      for i in 0..<rowCount {
        if grid[i][j] == "0" {
          emptyIndexes.append(i)
        } else if grid[i][j] == "E" {
          currentEnemies += 1
        } else if grid[i][j] == "W" {
          for row in emptyIndexes {
            colMetrix[row][j] = currentEnemies
          }
          emptyIndexes = []
          currentEnemies = 0
        }
        for row in emptyIndexes {
          colMetrix[row][j] = currentEnemies
        }
      }
    }
    
    var result = 0
    for i in 0..<rowCount {
      for j in 0..<colCount {
        if grid[i][j] == "0" {
          let current = colMetrix[i][j] + rowMetrix[i][j]
          if current > result {
            result = current
          }
        }
      }
    }
    return result
  }
  
  func test() {
    let t1 = Array("0E00".characters)
    let t2 = Array("E0WE".characters)
    let t3 = Array("0E00".characters)
    let testCase = [t1, t2, t3]
    let result = maxKilledEnemies(testCase)
    print(result)
  }
}
