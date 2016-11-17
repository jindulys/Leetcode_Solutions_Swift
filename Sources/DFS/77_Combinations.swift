//
//  77_Combinations.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-16.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:77 Combinations
	URL: https://leetcode.com/problems/combinations/
	Space: O(N^K)
	Time: O(K*N^K)
*/

class Combinations_Solution {
  func combine(_ n: Int, _ k: Int) -> [[Int]] {
    if n < k || k == 0 {
      return []
    }
    var result: [[Int]] = []
    dfs(result: &result, start: 1, n: n, currentCombination: [], remained: k)
    return result
  }
  
  func dfs(result: inout [[Int]],
           start: Int,
           n: Int,
           currentCombination: [Int],
           remained: Int) {
    if remained == 0 {
      result.append(currentCombination)
      return
    }
    if start > n {
      return
    }
    for i in start...n {
      var newCombination = currentCombination
      newCombination.append(i)
      dfs(result: &result,
          start: i + 1,
          n: n,
          currentCombination: newCombination,
          remained: remained - 1)
    }
  }
  
  func test() {
    let result = combine(4, 2)
    print(result)
  }
}
