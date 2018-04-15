//
//  772_BasicCalculatorIII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-15.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

import Foundation

/**
 Title:772 Basic Calculator III
 URL: https://leetcode.com/problems/basic-calculator-iii/description/
 Space: O(n)
 Time: O(n)
 */
class BasicCalculatorIII {
  func calculate(_ s: String) -> Int {
    guard s.count > 0 else {
      return 0
    }
    let (result, _) = calculate(s, startIndex: s.startIndex)
    return result
  }

  func calculate(_ s: String, startIndex: String.Index) -> (Int, String.Index) {
    guard s.count > 0 && startIndex < s.endIndex else {
      return (0, s.startIndex)
    }
    var numbers: [Int] = []
    var signs: [Character] = []
    var index: String.Index = startIndex

    while index < s.endIndex {
      if s[index] == "+" {
        signs.append("+")
      } else if s[index] == "-" {
        signs.append("-")
      } else if s[index] == "*" {
        signs.append("*")
      } else if s[index] == "/" {
        signs.append("/")
      } else if s[index] == "(" {
        let (result, updatedIndex) = calculate(s, startIndex: s.index(after:index))
        handleResult(result, signs: &signs, numbers: &numbers)
        index = updatedIndex
      } else if s[index] == ")" {
        return (numbers.reduce(0){ $0 + $1 }, index)
      } else if s[index] != " " {
        var localIndex = index
        var numberString = ""
        while localIndex < s.endIndex && s[localIndex] >= "0" && s[localIndex] <= "9" {
          numberString += String(s[localIndex])
          localIndex = s.index(after: localIndex)
        }
        let number = Int(numberString)!
        handleResult(number, signs: &signs, numbers: &numbers)
        index = s.index(before: localIndex)
      }
      index = s.index(after: index)
    }
    return (numbers.reduce(0){ $0 + $1 }, index)
  }

  func handleResult(_ number: Int, signs: inout [Character], numbers: inout [Int]) {
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
      numbers.append(number)
    }
  }
}
