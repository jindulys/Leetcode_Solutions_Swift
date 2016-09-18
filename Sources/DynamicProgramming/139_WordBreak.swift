//
//  139_WordBreak.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-11.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:139 Word Break
	URL: https://leetcode.com/problems/word-break/
	Space: O(n)
	Time: O(nL^2)
 */

class WordBreak_Solution {
  func wordBreak(_ s: String, wordSet:Set<String>) -> Bool {
    guard s.characters.count > 0 || wordSet.count > 0 else {
      return true
    }
    let longestWordLength = wordSet.reduce(0) {
      return max($0, $1.characters.count)
    }
    // Query Array means the first 'x' elements could be broken by word set.
    var queryArray = Array(repeating: false, count: s.characters.count + 1)
    queryArray[0] = true
    for i in 1...s.characters.count {
      queryArray[i] = false
      for currentWordLength in 1...longestWordLength {
        if i < currentWordLength {
          break
        }
        if !queryArray[i - currentWordLength] {
          continue
        }
        let currentRange = s.characters.index(s.startIndex, offsetBy: i - currentWordLength)..<s.characters.index(s.startIndex, offsetBy: i)
        let currentSubString = s[currentRange]
        if wordSet.contains(currentSubString) {
          queryArray[i] = true
          break
        }
      }
    }
    return queryArray[s.characters.count]
  }
  
  func test() {
    let result1 = wordBreak("leetcode", wordSet: ["leet", "code"])
    if result1 {
      print("Word Break Test1 Success.")
    } else {
      print("Word Break Test1 Failure.")
    }
    
    let result2 = wordBreak("leetcodem", wordSet: ["leet", "code"])
    if result2 {
      print("Word Break Test2 Success.")
    } else {
      print("Word Break Test2 Failure.")
    }
  }
}
