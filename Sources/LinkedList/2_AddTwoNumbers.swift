//
//  2_AddTwoNumbers.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:2 Add Two Numbers
	URL: https://leetcode.com/submissions/detail/73064342/
	Space: O(n)
	Time: O(n)
 */

class AddTwoNumbers_Solution {
  var currentLastNode: ListNode?
  
  func addTwoNumbers(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var currentL1 = l1
    var currentL2 = l2
    var currentCarry: Int = 0
    var result: ListNode?
    while let computedL1 = currentL1, let computedL2 = currentL2 {
      helper(computedL1.val, val2: computedL2.val, carray: &currentCarry, result: &result)
      currentL1 = computedL1.next
      currentL2 = computedL2.next
    }
    // we still have L1
    while let computedL1 = currentL1 {
      helper(computedL1.val, val2: 0, carray: &currentCarry, result: &result)
      currentL1 = computedL1.next
    }
    // we still have L2
    while let computedL2 = currentL2 {
      helper(0, val2: computedL2.val, carray: &currentCarry, result: &result)
      currentL2 = computedL2.next
    }
    if currentCarry > 0 {
      helper(0, val2: 0, carray: &currentCarry, result: &result)
    }
    return result
  }
  
  func helper(val1: Int, val2: Int, inout carray: Int, inout result: ListNode?) {
    let currentVal = (val1 + val2 + carray) % 10
    carray = (val1 + val2 + carray) / 10
    if let tmp = currentLastNode {
      tmp.next = ListNode(currentVal)
      currentLastNode = tmp.next
    } else {
      result = ListNode(currentVal)
      currentLastNode = result
    }
  }
}