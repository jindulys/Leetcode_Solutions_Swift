//
//  28_ImplementStrStr.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-11.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:28 Implement strStr
	URL: https://leetcode.com/problems/implement-strstr/
	Space: O(n)
	Time: O(mn)
 */

class ImplementStrStr_Solution {
  func strStr(haystack: String, _ needle: String) -> Int {
    let longCharacters = Array(haystack.characters)
    let shortCharacters = Array(needle.characters)
    // NOTE: First time I missed this guard.
    guard longCharacters.count >= shortCharacters.count else {
      return -1
    }
    for i in 0...(longCharacters.count - shortCharacters.count) {
      var found = true
      for j in 0..<shortCharacters.count {
        if longCharacters[i + j] != shortCharacters[j] {
          found = false
          break
        }
      }
      if found {
        return i
      }
    }
    return -1
  }
}
