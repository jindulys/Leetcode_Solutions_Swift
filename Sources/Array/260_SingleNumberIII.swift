//
//  SingleNumberIII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-28.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

/**
 Title: 228 Summary Ranges
 URL: https://leetcode.com/problems/summary-ranges/
 Space: O(1)
 Time: O(N)
 */
class SingleNumberIII {
//  func not_efficient_singleNumber(_ nums: [Int]) -> [Int] {
//    var result: Set<Int> = []
//    var found: Int = 0
//    for i in nums {
//      if result.contains(i) {
//        result.remove(i)
//      } else {
//        result.insert(i)
//      }
//    }
//    return Array(result)
//  }

  func singleNumber(_ nums: [Int]) -> [Int] {
    var result = Array(repeatElement(0, count: 2))
    var tmp: Int = 0
    for num in nums {
      tmp = tmp ^ num
    }
    // Find num's any position that is 1, for our case we can
    // find the first 1 from right to left by following trick.
    let mask = tmp & -tmp
    for num in nums {
      if num & mask == 0 {
        result[0] = result[0] ^ num
      } else {
        result[1] = result[1] ^ num
      }
    }
    return result
  }
}
