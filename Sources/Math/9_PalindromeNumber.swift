//
//  9_PalindromeNumber.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:9 Palindrome Number
	URL: https://leetcode.com/problems/palindrome-number/
	Space: O(1)
	Time: O(1)
 */

class PalindromeNumber_Solution {
  func isPalindrome(x: Int) -> Bool {
    guard x >= 0 else {
      return false
    }
    var tenCount: Int = 1
    var loopx = x
    while loopx / 10 > 0 {
      tenCount *= 10
      loopx = loopx / 10
    }
    var processedX = x
    while processedX > 0 {
      let left = processedX / tenCount
      let right = processedX % 10
      if left != right {
        return false
      }
      processedX = processedX % tenCount
      processedX = processedX / 10
      tenCount /= 100
    }
    return true
  }
}
