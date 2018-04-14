//
//  224_BasicCalculator.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-14.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

class BasicCalculation {

  /**
   Title:224 Basic Calculator
   URL: https://leetcode.com/problems/basic-calculator/description/
   Space: O(n)
   Time: O(n)
   */
  func calculate(_ s: String) -> Int {
    guard s.count > 0 else {
      return 0
    }
    var stack: [String] = []
    let operations: Set<Character> = ["+", "-"]
    let numbers: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var index = s.startIndex
    while index < s.endIndex {
      if operations.contains(s[index]) || s[index] == "(" {
        stack.append(String(s[index]))
      } else if s[index] == ")" {
        var leftBoundaryIndex = stack.index(before: stack.endIndex)
        while leftBoundaryIndex >= stack.startIndex && stack[leftBoundaryIndex] != "(" {
          leftBoundaryIndex = stack.index(before: leftBoundaryIndex)
        }
        calculateExpressAndReplace(&stack, inner: true)
      } else if s[index] != " " {
        var currentNumberString = ""
        var localIndex = index
        while localIndex < s.endIndex, numbers.contains(s[localIndex]) {
          currentNumberString += String(s[localIndex])
          localIndex = s.index(after: localIndex)
        }
        stack.append(currentNumberString)
        index = s.index(before: localIndex)
      }
      index = s.index(after: index)
    }
    calculateExpressAndReplace(&stack, inner: false)
    if stack.count == 1 {
      return Int(stack[0])!
    } else {
      return -1
    }
  }

  func calculateExpressAndReplace(_ array: inout [String], inner: Bool) {
    guard array.count > 0 else {
      return
    }
    var leftBoundaryIndex = inner ? array.index(before: array.endIndex) : array.startIndex
    if inner {
      while leftBoundaryIndex >= array.startIndex && array[leftBoundaryIndex] != "(" {
        leftBoundaryIndex = array.index(before: leftBoundaryIndex)
      }
    }
    var result: Int? = nil
    var handlingIndex = inner ? array.index(after: leftBoundaryIndex) : array.startIndex
    var currentOperation: ((Int, Int) -> Int)?
    while handlingIndex < array.endIndex {
      if array[handlingIndex] == "+" {
        currentOperation = { $0 + $1 }
      } else if array[handlingIndex] == "-" {
        currentOperation = { $0 - $1 }
      } else if let currentResult = result {
        if let toHandle = Int(array[handlingIndex]), let operation = currentOperation {
          result = operation(currentResult, toHandle)
        }
      } else {
        if let toHandle = Int(array[handlingIndex]) {
          result = toHandle
        }
      }
      handlingIndex = array.index(after: handlingIndex)
    }
    if inner && array.startIndex < leftBoundaryIndex {
      array = Array(array[array.startIndex..<leftBoundaryIndex])
    } else {
      array = []
    }
    if let calculated = result {
      array.append(String(calculated))
    }
  }

}
