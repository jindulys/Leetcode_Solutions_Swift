//
//  445_AddTwoNumbersII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-17.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

/**
 Title: 445 Add Two Numbers II
 URL: https://leetcode.com/problems/add-two-numbers-ii
 Space: O(1)
 Time: O(N)
 */
class AddTwoNumbersII {
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var reversedL1 = revertListNode(l1)
    var reversedL2 = revertListNode(l2)
    var flag: Int = 0
    var resultList: ListNode? = nil
    while let validL1 = reversedL1, let validL2 = reversedL2 {
      reversedL1 = validL1.next
      reversedL2 = validL2.next
      let lnumber = validL1.val
      let rnumber = validL2.val
      let total = lnumber + rnumber + flag
      let current = ListNode(total % 10)
      current.next = resultList
      resultList = current
      flag = total / 10
    }

    while let validL1 = reversedL1 {
      reversedL1 = validL1.next
      let number = validL1.val
      let total = number + flag
      let current = ListNode(total % 10)
      current.next = resultList
      resultList = current
      flag = total / 10
    }

    while let validL2 = reversedL2 {
      reversedL2 = validL2.next
      let number = validL2.val
      let total = number + flag
      let current = ListNode(total % 10)
      current.next = resultList
      resultList = current
      flag = total / 10
    }

    if flag == 1 {
      let current = ListNode(1)
      current.next = resultList
      resultList = current
    }
    return resultList
  }

  private func revertListNode(_ node: ListNode?) -> ListNode? {
    var checkingNode = node
    var currentHead: ListNode? = nil
    while let validNode = checkingNode {
      checkingNode = validNode.next
      validNode.next = currentHead
      currentHead = validNode
    }
    return currentHead
  }

  func addTwoNumbers_stack(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1Stack: [Int] = []
    var l2Stack: [Int] = []

    var currentL1 = l1
    while let valid = currentL1 {
      l1Stack.append(valid.val)
      currentL1 = valid.next
    }

    var currentL2 = l2
    while let valid = currentL2 {
      l2Stack.append(valid.val)
      currentL2 = valid.next
    }

    var flag: Int = 0
    var result: ListNode? = nil
    while l1Stack.count != 0 || l2Stack.count != 0 {
      var one = 0
      if l1Stack.count != 0 {
        one = l1Stack.removeLast()
      }
      var two = 0
      if l2Stack.count != 0 {
        two = l2Stack.removeLast()
      }
      let current = one + two + flag
      let currentNode = ListNode(current % 10)
      currentNode.next = result
      result = currentNode
      flag = current / 10
    }

    if flag > 0 {
      let newNode = ListNode(flag)
      newNode.next = result
      result = newNode
    }
    return result
  }

}
