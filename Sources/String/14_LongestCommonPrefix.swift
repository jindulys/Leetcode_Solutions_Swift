//
//  14_LongestCommonPrefix.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-14.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:14 Longest Common Prefix
	URL: https://leetcode.com/problems/longest-common-prefix/
	Space: O(nm)
	Time: O(mn)
 */

class LongestCommonPrefix_Solution {
  func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count > 0 else {
      return ""
    }
    let count = strs.map {
      $0.characters.count
      }.reduce(Int.max) {
        min($0, $1)
    }
    guard count > 0 else {
      return ""
    }
    let strsCharacters = strs.map {
      Array($0.characters)
    }
    var currentSatisfiedCount = 0
    for i in 0..<count {
      let currentCheck = strsCharacters[0][i]
      let checkResult = strsCharacters.reduce(true) {
        $0 && ($1[i] == currentCheck)
      }
      if !checkResult {
        break
      }
      currentSatisfiedCount += 1
    }
    return String(strsCharacters[0][0..<currentSatisfiedCount])
  }
}
