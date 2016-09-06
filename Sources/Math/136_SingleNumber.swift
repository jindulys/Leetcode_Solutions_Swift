//
//  136_SingleNumber.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:136 Single Number
	URL: https://leetcode.com/problems/single-number/
	Space: O(1)
	Time: O(n)
 */

class SingleNumber_Solution {
  func singleNumber(nums: [Int]) -> Int {
    var ret: Int = 0
    for i in nums {
      ret ^= i
    }
    return ret
  }
}
