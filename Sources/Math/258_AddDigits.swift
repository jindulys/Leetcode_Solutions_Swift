//
//  258_AddDigits.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:258 Add Digits
	URL: https://leetcode.com/problems/add-digits/
	Space: O(1)
	Time: O(1)
 */

class AddDigits_Solution {
  func addDigits(_ num: Int) -> Int {
    var currentDigitsArray = [Int]()
    var tenCount: Int = 1
    while num / tenCount >= 10 {
      tenCount = tenCount * 10
    }
    var loopNum = num
    while loopNum > 0 {
      currentDigitsArray.append(loopNum / tenCount)
      loopNum = loopNum - (loopNum / tenCount) * tenCount
      tenCount = tenCount / 10
    }
    let sum = currentDigitsArray.reduce(0) {
      $0 + $1
    }
    if sum < 10 {
      return sum
    }
    return addDigits(sum)
  }
}
