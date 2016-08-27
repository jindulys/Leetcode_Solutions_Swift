//
//  217_ContainsDuplicate.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:217 Contains Duplicate
	URL: https://leetcode.com/problems/contains-duplicate/
	Space: O(n)
	Time: O(n)
 */

class ContainsDuplicate_Solution {
  // Use set.
  func containsDuplicate(nums: [Int]) -> Bool {
    let numsSet = Set(nums)
    return numsSet.count != nums.count
  }
}