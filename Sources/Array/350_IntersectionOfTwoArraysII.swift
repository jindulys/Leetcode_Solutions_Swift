//
//  350_IntersectionOfTwoArraysII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:350 Intersection of two arrays II
	URL: https://leetcode.com/problems/intersection-of-two-arrays-ii/
	Space: O(n)
	Time: O(n) Hsn
 */

class IntersectionOfTwoArraysII_Solution {
  func intersect(nums1: [Int], _ nums2: [Int]) -> [Int] {
    var result: [Int] = []
    let nums1Dict = nums1.generateCountDict()
    let nums2Dict = nums2.generateCountDict()
    for (element, occuranceCount) in nums1Dict {
      if let nums2OccuranceCount = nums2Dict[element] {
        result.appendContentsOf(Array(count: min(occuranceCount, nums2OccuranceCount),
                              repeatedValue: element))
      }
    }
    return result
  }
}

// TODO(simonli): move to `LeetCodeKit`.
extension Array where Element: Hashable {
  /// generate count dict.
  /// - key : the element in the array.
  /// - value: the occurance count of this array.
  public func generateCountDict() -> [Element: Int] {
    var dict: [Element: Int] = [:]
    for element in self {
      if let occuranceCount = dict[element] {
        dict[element] = occuranceCount + 1
      } else {
        dict[element] = 1
      }
    }
    return dict
  }
}