//
//  5_LongestPalindromicSubString.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
 * Dynamic Programmin
 * if s[i] == s[j], then we need to check whether or not s[i+1,..,j-1] is
 * palindrome.
 */

/**
	Title:5 Longest Palindromic Substring
	URL: https://leetcode.com/problems/longest-palindromic-substring/
	Space: O(n^2)
	Time: O(n^2)
 */

class LongestPalindromicSubString_Solution {
  func longestPalindrome(_ s: String) -> String {
    guard s.characters.count > 1 else {
      return s
    }
    let characters = Array(s.characters)
    let totalLength = characters.count
    var maxStartIndex: Int = 0
    var maxLength: Int = 1
    var palindromicTable =
      Array(repeating: Array(repeating: false, count: totalLength),
            count: totalLength)
    for i in 0..<characters.count {
      palindromicTable[i][i] = true
      maxStartIndex = i
      maxLength = 1
    }
    for i in 0..<characters.count - 1 {
      if characters[i] == characters[i + 1] {
        palindromicTable[i][i+1] = true
        maxLength = 2
        maxStartIndex = i
      }
    }
    if totalLength >= 3 {
      for length in 3...totalLength {
        for i in 0...(totalLength - length) {
          if characters[i] == characters[i + length - 1]
            && palindromicTable[i + 1][i + length - 2] == true {
            palindromicTable[i][i + length - 1] = true
            maxStartIndex = i
            maxLength = length
          }
        }
      }
    }
    return String(characters[maxStartIndex...(maxStartIndex + maxLength - 1)])
  }
}
