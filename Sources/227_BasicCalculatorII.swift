//
//  227_BasicCalculatorII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-14.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

import Foundation

/**
 Title:227 Basic Calculator II
 URL: https://leetcode.com/problems/basic-calculator-ii/description/
 Space: O(n)
 Time: O(n)
 */
class BasicCalculatorII {
  func calculate(_ s: String) -> Int {
    guard s.count > 0 else {
      return 0
    }
    var numbers: [Int] = []
    var signs: [Character] = []
    var index = s.startIndex
    while index < s.endIndex {
      if s[index] == "+" {
        signs.append("+")
      } else if s[index] == "-" {
        signs.append("-")
      } else if s[index] == "*" {
        signs.append("*")
      } else if s[index] == "/" {
        signs.append("/")
      } else if s[index] != " " {
        var localIndex = index
        var numberString = ""
        while localIndex < s.endIndex && s[localIndex] >= "0" && s[localIndex] <= "9" {
          numberString += String(s[localIndex])
          localIndex = s.index(after: localIndex)
        }
        let number = Int(numberString)!
        if signs.count > 0 {
          let previousSign = signs.removeLast()
          if previousSign == "+" {
            numbers.append(number)
          } else if previousSign == "-" {
            numbers.append(number * -1)
          } else if previousSign == "*" {
            let previous = numbers.removeLast()
            numbers.append(previous * number)
          } else if previousSign == "/" {
            let previous = numbers.removeLast()
            numbers.append(previous / number)
          }
        } else {
          numbers.append(Int(numberString)!)
        }
        index = s.index(before: localIndex)
      }
      index = s.index(after: index)
    }
    return numbers.reduce(0){ $0 + $1 }
  }
}
