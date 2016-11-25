//
//  20_ValidParentheses.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-24.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:20 Valid Parentheses
	URL: https://leetcode.com/problems/valid-parentheses/
	Space: O(N)
	Time: O(N)
 */

class ValidParentheses_Solution {
  func isValid(_ s: String) -> Bool {
    let characters = [Character](s.characters)
    let validInput = "([{"
    var characterStack = [Character]()
    for i in characters {
      if validInput.characters.contains(i) {
        characterStack.push(i)
        continue
      }
      switch i {
      case ")":
        if let firstPop = characterStack.pop() {
          if firstPop != "(" {
            return false
          }
        } else {
          return false
        }
      case "]":
        if let firstPop = characterStack.pop() {
          if firstPop != "[" {
            return false
          }
        } else {
          return false
        }
      case "}":
        if let firstPop = characterStack.pop() {
          if firstPop != "{" {
            return false
          }
        } else {
          return false
        }
      default:
        return false
      }
    }
    return characterStack.isEmpty
  }
}
