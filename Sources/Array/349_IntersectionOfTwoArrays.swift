//
//  349_IntersectionOfTwoArrays.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:349 Intersection of two arrays
	URL: https://leetcode.com/problems/intersection-of-two-arrays/
	Space: O(n)
	Time: O(n)
 */

class IntersectionofTwoArrays_Solution {
  func intersection(nums1: [Int], _ nums2: [Int]) -> [Int] {
    let result = Set(nums1).intersect(nums2)
    return Array(result)
  }
}