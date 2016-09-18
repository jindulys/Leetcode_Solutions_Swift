//
//  383_RansomNote.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:383 Ransom Note
	URL: https://leetcode.com/problems/ransom-note/
	Space: O(n)
	Time: O(n)
 */

class RansomeNote_Solution {
  // My thoughts:
  // 1. construct the dictionary(character: count) for both `ransomNote` and `magazine`.
  // 2. make sure each key exist in magazine dictionary and count is less than its counterpart.
  func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    // Construct ransomNote Dictionary
    let noteDict = generateCharacterDictFrom(ransomNote)
    let magazineDict = generateCharacterDictFrom(magazine)
    var contained: Bool = true
    for (currentCharacter, count) in noteDict {
      if let magazineCount = magazineDict[currentCharacter] {
        if magazineCount < count {
          contained = false
          break
        }
      } else {
        contained = false
        break
      }
    }
    return contained
  }
  
  func generateCharacterDictFrom(_ string: String) -> [Character: Int] {
    var dict: [Character: Int] = [:]
    for rc in string.characters {
      if let rcCount = dict[rc] {
        dict[rc] = rcCount + 1
      } else {
        dict[rc] = 1
      }
    }
    return dict
  }
}
