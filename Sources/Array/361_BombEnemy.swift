//
//  361_BombEnemy.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:361 Bomb Enemy
	URL: https://leetcode.com/problems/bomb-enemy/
	Space: O(MN)
	Time: O(N)
 */

class BombEnemySolution {
  func maxKilledEnemies(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else {
      return 0
    }
    let rowCount = grid.count
    let colCount = grid[0].count
    var currentRow = 0
    var cols = Array(repeating: 0, count: colCount)
    var result = 0
    
    for i in 0..<rowCount {
      for j in 0..<colCount {
        // NOTE: calculate col.
        if i == 0 || grid[i - 1][j] == "W" {
          var currentColE = 0
          for m in i..<rowCount {
            if grid[m][j] == "W" {
              break
            } else if grid[m][j] == "E" {
              currentColE += 1
            }
          }
          cols[j] = currentColE
        }
        
        // NOTE: calculate row.
        if j == 0 || grid[i][j - 1] == "W" {
          currentRow = 0
          for m in j..<colCount {
            if grid[i][m] == "W" {
              break
            } else if grid[i][m] == "E" {
              currentRow += 1
            }
          }
        }
        
        if grid[i][j] == "W" {
          continue
        }
        
        if grid[i][j] == "0" {
          result = currentRow + cols[j] > result ? currentRow + cols[j] : result
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
