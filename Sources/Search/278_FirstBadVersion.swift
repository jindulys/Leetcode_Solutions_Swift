//
//  278_FirstBadVersion.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:278 First Bad Version
	URL: https://leetcode.com/problems/first-bad-version/
	Space: O(1)
	Time: O(lan)
 */

class FirstBadVersion_Solution {
  func isBadVersion(version: Int) -> Bool {
    return version >= 1801
  }
  func solution(version: Int) -> Int {
    guard version > 1 else {
      return version
    }
    var start = 1
    var end = version
    
    while start + 1 < end {
      let mid = start + (end - start) / 2
      if isBadVersion(mid) {
        end = mid
      } else {
        start = mid
      }
    }
    if isBadVersion(start) {
      return start
    }
    if isBadVersion(end) {
      return end
    }
    return -1
  }
  
  func test() {
    let result = solution(10000)
    if result == 1801 {
      print("Pass")
    } else {
      print("Failed")
    }
  }
}
