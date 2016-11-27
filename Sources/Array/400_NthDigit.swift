//
//  400_NthDigit.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-26.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:400 Nth Digit
	URL: https://leetcode.com/problems/nth-digit/
	Space: O(lgN)
	Time: O(1)
 */

class NthDigit_Solution {
  func findNthDigit(_ n: Int) -> Int {
    // Firstly, find the len for that nth number.
    var len = 1
    var count = 9
    var remainedN = n
    var start = 1
    while remainedN > len * count {
      remainedN -= len * count
      len = len + 1
      count = count * 10
      start = start * 10
    }
    // Secondly, find the number the Nth digit belongs to.
    start += (remainedN - 1) / len
    let startString = String(start)
    // Thirdly, find the character the Nth digit of that finded number.
    let indexedCharacter = [Character](startString.characters)[(remainedN - 1) % len]
    return Int(String(indexedCharacter))!
  }
}
