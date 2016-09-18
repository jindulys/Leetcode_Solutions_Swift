//
//  69_Sqrtx.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-03.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:69 Sqrt(x)
	URL: https://leetcode.com/problems/sqrtx/
	Space: O(1)
	Time: O(lgn)
 */

class Sqrt_Solution {
  func mySqrt(_ x: Int) -> Int {
    guard x > 1 else {
      return x >= 0 ? x : -1
    }
    var start = 1
    var end = x
    while start + 1 < end {
      let mid = start + (end - start) / 2
      if mid * mid == x {
        return mid
      } else if mid * mid > x {
        end = mid
      } else {
        start = mid
      }
    }
    if start * start == x {
      return start
    }
    if start * start < x && end * end > x {
      return start
    }
    if end * end == x {
      return end
    }
    return -1
  }
  
  func test() {
    print(mySqrt(10))
    print(mySqrt(1))
    print(mySqrt(36))
    print(mySqrt(0))
    print(mySqrt(100))
    print(mySqrt(10000))
  }
}
