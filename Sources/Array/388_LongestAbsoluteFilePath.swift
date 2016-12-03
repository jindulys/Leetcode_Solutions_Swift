//
//  388_LongestAbsoluteFilePath.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-12-03.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:388 Longest Absolute File Path Solution
	URL: https://leetcode.com/problems/longest-absolute-file-path/
	Space: O(N)
	Time: O(N)
 */

class LongestAbsoluteFilePath_Solution {
  func lengthLongestPath(_ input: String) -> Int {
    guard input.characters.count > 0 else {
      return 0
    }
    let splitedCharacters: [[Character]] =
      input.characters.split(separator: "\n").map {
      Array(String($0).characters)
    }
    // 0 as a dummy index, so we could no need to worry about borders.
    var depthDictionary: [Int : Int] = [0 : 0]
    var maxLength = 0
    for characters in splitedCharacters {
      let totalCharacterCount = characters.count
      var tabCount = 0
      var currentIsFile = false
      for i in 0..<totalCharacterCount {
        if characters[i] == "\t" {
          tabCount += 1
        }
        if characters[i] == "." {
          currentIsFile = true
          break
        }
      }
      let currentCharacterCount = totalCharacterCount - tabCount
      if currentIsFile {
        maxLength = max(maxLength, depthDictionary[tabCount]! + currentCharacterCount)
      } else {
        depthDictionary[tabCount + 1] = depthDictionary[tabCount]! + currentCharacterCount + 1
      }
    }
    return maxLength
  }
}
