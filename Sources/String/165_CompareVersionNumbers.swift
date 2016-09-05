//
//  165_CompareVersionNumbers.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:165 Compare Version Numbers
	URL: https://leetcode.com/problems/compare-version-numbers/
	Space: O(n)
	Time: O(n)
 */

class CompareVersionNumbers_Solution {
  func compareVersion(version1: String, _ version2: String) -> Int {
    let version1Number = version1.characters.split(".").map {
      Int(String($0))
    }
    let version2Number = version2.characters.split(".").map {
      Int(String($0))
    }
    var loopCount: Int = 0
    for i in 0..<min(version1Number.count, version2Number.count) {
      if version1Number[i] > version2Number[i] {
        return 1
      } else if version1Number[i] < version2Number[i] {
        return -1
      }
      loopCount += 1
    }
    if version1Number.count >= loopCount + 1 {
      let remained = version1Number[loopCount...(version1Number.count - 1)]
      let remainedCount = Array(remained).reduce(0) {
        $0 + $1!
      }
      if remainedCount > 0 {
        return 1
      }
    } else if version2Number.count >= loopCount + 1 {
      let remained = version2Number[loopCount...(version2Number.count - 1)]
      let remainedCount = Array(remained).reduce(0) {
        $0 + $1!
      }
      if remainedCount > 0 {
        return -1
      }
    }
    return 0
  }
  
  func test() {
    let test1 = compareVersion("1", "1.1")
    if test1 == -1 {
      print("Compared Version Numbers Pass")
    } else {
      print("Failed")
    }
  }
}