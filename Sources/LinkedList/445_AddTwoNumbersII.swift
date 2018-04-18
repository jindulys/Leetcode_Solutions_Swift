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
}
