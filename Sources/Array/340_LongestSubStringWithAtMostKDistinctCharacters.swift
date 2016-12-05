//
//  340_LongestSubStringWithAtMostKDistinctCharacters.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-12-04.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:340 Longest SubString with At Most K Distinct Characters
	URL: https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/
	Space: O(1)
	Time: O(N)
 */

class LongestSubStringWithAtMostKDistinctCharacters_Solution {
  func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
    let characters = Array(s.characters)
    if characters.count == 0 || k == 0 {
      return 0
    }
    var characterDict = [Character : Int]()
    var lowerBound = 0
    var result = 0
    for i in 0..<characters.count {
      if let count = characterDict[characters[i]] {
        characterDict[characters[i]] = count + 1
      } else {
        characterDict[characters[i]] = 1
      }
      while characterDict.count > k {
        if let count = characterDict[characters[lowerBound]] {
          characterDict[characters[lowerBound]] = count - 1
          if count == 1 {
            characterDict.removeValue(forKey: characters[lowerBound])
          }
        }
        lowerBound += 1
      }
      result = max(result, i - lowerBound + 1)
    }
    return result
  }
  
  func test() {
    let result = lengthOfLongestSubstringKDistinct("aba", 1)
    print(result)
  }
}
