//
//  389_FindTheDifference.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:389 Find the difference
	URL: https://leetcode.com/problems/find-the-difference/
	Space: O(n)
	Time: O(n)
 */

class FindTheDifference_Solution {
  func solution(s: String, t: String) -> Character {
    var sDict: [Character : Int] = [:]
    var tDict: [Character : Int] = [:]
    for sc in s.characters {
      if let sCount = sDict[sc] {
        sDict[sc] = sCount + 1
      } else {
        sDict[sc] = 1
      }
    }
    for tc in t.characters {
      if let tCount = tDict[tc] {
        tDict[tc] = tCount + 1
      } else {
        tDict[tc] = 1
      }
    }
    for (c, _) in tDict {
      if sDict[c] != nil {
        continue
      } else {
        return c
      }
    }
    return "*"
  }
  
  func test() {
    let result = solution("abcd", t: "abcde")
    let correctResult = "e"
    if result == correctResult[correctResult.startIndex] {
      print("Find the difference Pass")
    } else {
      print("Find the difference Failed")
    }
  }
}