//
//  242_ValidAnagram.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-11.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:242 Valid Anagram
	URL: https://leetcode.com/problems/valid-anagram/
	Space: O(n)
	Time: O(n)
 */

class ValidAnagram_Solution {
  func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.characters.count == t.characters.count else {
      return false
    }
    let sCharacters = Array(s.characters)
    let tCharacters = Array(t.characters)
    var sDict:[Character : Int] = [:]
    var tDict:[Character : Int] = [:]
    for c in sCharacters {
      if let currentCount = sDict[c] {
        sDict[c] = currentCount + 1
      } else {
        sDict[c] = 1
      }
    }
    for c in tCharacters {
      if let currentCount = tDict[c] {
        tDict[c] = currentCount + 1
      } else {
        tDict[c] = 1
      }
    }
    var result = true
    for (key, value) in sDict {
      if let tCount = tDict[key] {
        result = result && (tCount == value)
      } else {
        return false
      }
    }
    return result
  }
}
