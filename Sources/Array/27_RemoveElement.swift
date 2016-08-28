//
//  27_RemoveElement.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:27 Remove Element
	URL: https://leetcode.com/problems/remove-element/
	Space: O(1)
	Time: O(n)
 */

class RemoveElement_Solution {
  func removeElement(inout nums: [Int], _ val: Int) -> Int {
    var len: Int = nums.count
    var i: Int = 0
    while i < len {
      while nums[i] == val && i < len {
        len -= 1
        nums[i] = nums[len]
      }
      i += 1
    }
    return len
  }
}