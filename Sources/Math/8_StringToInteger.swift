//
//  8_StringToInteger.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-06.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:8 String to Integer(atoi)
	URL: https://leetcode.com/problems/string-to-integer-atoi/
	Space: O(n)
	Time: O(1)
 */

class StringToInteger_Solution {
  func myAtoi(str: String) -> Int {
    var ret = 0
    var flag = 1
    var index = 0
    let zeroScalar = "0".unicodeScalars
    let maxIntRemained = String(Int.max % 10)
    let maxRemained = maxIntRemained[maxIntRemained.startIndex]
    let maxInt = Int(Int32.max)
    let minInt = Int(Int32.min)
    let characters = Array(str.characters)
    guard characters.count > 0 else {
      return ret
    }
    while characters[index] == " " {
      index += 1
    }
    if characters[index] == "-" || characters[index] == "+" {
      flag = 1 - 2 * (characters[index] == "-" ? 1 : 0)
      index += 1
    }
    while index <= characters.count - 1 &&
      characters[index] >= "0" && characters[index] <= "9" {
      if ret > maxInt / 10 ||
        (ret == maxInt / 10 && characters[index] > maxRemained) {
        if flag == 1 {
          return maxInt
        } else {
          return minInt
        }
      }
      // convert to unicode scalar value.
      let currentString = String(characters[index])
      let currentScalar = currentString.unicodeScalars
      ret = ret * 10 +
        Int(currentScalar[currentScalar.startIndex].value) -
        Int(zeroScalar[zeroScalar.startIndex].value)
      index += 1
    }
    return ret * flag
  }
  
  func test() {
    let test1 = myAtoi("2147483648")
    print(test1)
  }
}