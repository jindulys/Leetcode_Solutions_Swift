//
//  394_DecodeString.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:394 Decode String
	URL: https://leetcode.com/problems/decode-string/
	Space: O(N)
	Time: O(N)
 */

class DecodeString_Solution {
  func decodeString(_ s: String) -> String {
    guard s.characters.count > 0 else {
      return ""
    }
    var numberStack: [Int] = []
    var prefixStringStack: [String] = []
    let characters = Array(s.characters)
    var currentPrefix = ""
    var currentNumber = ""
    let numbers: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    for i in 0..<characters.count {
      if numbers.contains(characters[i]) {
        currentNumber += String(characters[i])
      } else if characters[i] == "]" {
        let repeatedTimes = numberStack.pop()!
        currentPrefix = currentPrefix * repeatedTimes
        let previousPrefix = prefixStringStack.pop()!
        currentPrefix = previousPrefix + currentPrefix
      } else if characters[i] != "[" {
        currentPrefix += String(characters[i])
      } else {
        prefixStringStack.push(currentPrefix)
        numberStack.push(Int(String(currentNumber))!)
        currentPrefix = ""
        currentNumber = ""
      }
    }
    return currentPrefix
  }
}
