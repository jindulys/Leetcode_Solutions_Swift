//
//  3_LongestSubStringWithoutRepeatingCharacters.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:3 Longest Substring without repeating characters
	URL: https://leetcode.com/problems/longest-substring-without-repeating-characters/
	Space: O(n)
	Time: O(n)
 */

class longestSubstringWithoutRepeatingCharacters_Solution {
  /// My Solution
  /// 1. we could keep walk through this string, keep max count we meet for now.
  /// 2. use a array to keep the record of currently non-repeated substring.remove
  ///   previous array if find any.
  func lengthOfLongestSubstring(s: String) -> Int {
    guard s.characters.count > 0 else {
      return 0
    }
    var maxCount = 0
    var nonRepeatedSubCharacters: [Character] = []
    for c in s.characters {
      if let findedIndex = nonRepeatedSubCharacters.indexOf(c) {
        // Remove elements before (included) findedIndex to include new
        // character and continue search.
        nonRepeatedSubCharacters.removeRange(0..<findedIndex+1)
        nonRepeatedSubCharacters.append(c)
      } else {
        nonRepeatedSubCharacters.append(c)
        if nonRepeatedSubCharacters.count > maxCount {
          maxCount = nonRepeatedSubCharacters.count
        }
      }
    }
    return maxCount
  }
}