//
//  409_LongestPalindrome.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-15.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

class LongestPalindrome {
  func longestPalindrome(_ s: String) -> Int {
    guard s.count > 0 else {
      return 0
    }
    let length = s.count
    var maxLength: Int = 0
    var dp =
        Array(repeatElement(Array(repeatElement(false, count: length + 1)), count: length))
    for i in 0...length {
      for j in 0..<length - i {
        if i == 0 || i == 1 {
          dp[j][i] = true
        } else if s[s.index(s.startIndex, offsetBy: j)] == s[s.index(s.startIndex, offsetBy: j + i - 1)] {
          dp[j][i] = dp[j][i - 2]
        } else {
          dp[j][i] = false
        }
        if dp[j][i] == true && i > maxLength{
          maxLength = i
        }
      }
    }
    return maxLength
  }
}
