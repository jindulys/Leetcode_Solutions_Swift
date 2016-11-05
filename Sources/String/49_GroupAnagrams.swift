//
//  49_GroupAnagrams.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:49 Group Anagrams
	URL: https://leetcode.com/problems/anagrams/
  m is the average length for the string in input array.
	Space: O(Nmlgm)
	Time: O(N)
 */

class GroupAnagrams_Solution {

  func groupAnagrams(_ strs: [String]) -> [[String]] {
    var anagramDict: [String: [String]] = [:]
    for str in strs {
      let sortedStr = String(str.characters.sorted { $0 < $1 })
      var existingAnagramGroup:[String] = []
      if let existing = anagramDict[sortedStr] {
        existingAnagramGroup = existing
      }
      existingAnagramGroup.append(str)
      anagramDict[sortedStr] = existingAnagramGroup
    }
    var result: [[String]] = []
    for strArr in anagramDict.values {
      result.append(strArr)
    }
    return result
  }

  /// What the fuck, I came up a so fucking low solution.
  /// I forget that each anagram group actually shares a common key.
  func groupAnagramsMySolution(_ strs: [String]) -> [[String]] {
    guard strs.count > 0 else {
      return []
    }
    let sortedStrs = strs.sorted { (str1, str2) -> Bool in
      str1.characters.count < str2.characters.count
    }
    var strsByLength: [[String]] = []
    var currentWorkingStrs: [String] = []
    var currentLength = sortedStrs[0].characters.count
    for str in sortedStrs {
      if str.characters.count == currentLength {
        currentWorkingStrs.append(str)
      } else {
        strsByLength.append(currentWorkingStrs)
        currentWorkingStrs = [str]
        currentLength = str.characters.count
      }
    }
    strsByLength.append(currentWorkingStrs)

    var result: [[String]] = []
    for strArr in strsByLength {
      if strArr.count == 1 {
        result.append(strArr)
        continue
      }
      var hasFound: [Int] = []
      for i in 0..<strArr.count - 1 {
        if hasFound.contains(i) {
          continue
        }
        var currentResult: [String] = []
        for j in (i + 1)..<strArr.count {
          if twoStringsAnagrams(strArr[i], strArr[j]) {
            currentResult.append(strArr[j])
            hasFound.append(j)
          }
        }
        currentResult.append(strArr[i])
        hasFound.append(i)
        result.append(currentResult)
      }
      if !hasFound.contains(strArr.count - 1) {
        result.append([strArr[strArr.count - 1]])
      }
    }
    return result
  }

  // Detect whether or not two strings are anagrams.
  func twoStringsAnagrams(_ str1: String, _ str2: String) -> Bool {
    guard str1.characters.count == str2.characters.count else {
      return false
    }
    let dict1 = self.generateDictionaryForCharacterFromString(str1)
    let dict2 = self.generateDictionaryForCharacterFromString(str2)
    
    for (cha, chaCount) in dict1 {
      if let chaCount2 = dict2[cha], chaCount2 == chaCount {
        continue
      }
      return false
    }
    return true
  }

  func generateDictionaryForCharacterFromString(_ str: String) -> [Character: Int] {
    guard str.characters.count > 0 else {
      return [:]
    }
    var dict: [Character: Int] = [:]
    for c in str.characters {
      if let count = dict[c] {
        dict[c] = count + 1
      } else {
        dict[c] = 1
      }
    }
    return dict
  }
}
