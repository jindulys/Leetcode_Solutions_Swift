//
//  145_BinaryTreePostorderTraversal.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-09.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:145 Binary Tree Post Order Traversal
	URL: https://leetcode.com/problems/binary-tree-postorder-traversal/
	Space: O(N)
	Time: O(N)
 */

class BinaryTreePostOrderTraversal_Solution {
  func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var stack: [TreeNode] = []
    var resultList: ListNode? = ListNode(0)
    let dummyFirst = resultList
    guard let validRoot = root else {
      return []
    }
    stack.push(validRoot)
    while let checkingNode = stack.pop() {
      resultList?.next = ListNode(checkingNode.val)
      resultList = resultList?.next
      if let leftNode = checkingNode.left {
        stack.push(leftNode)
      }
      if let rightNode = checkingNode.right {
        stack.push(rightNode)
      }
    }
    let correctResult = self.reverseList(dummyFirst?.next)
    return self.listNodeToArray(correctResult)
  }
  
  func reverseList(_ head: ListNode?) -> ListNode? {
    var temp: ListNode?
    var first = head
    while let validNode = first {
      first = validNode.next
      validNode.next = temp
      temp = validNode
    }
    return temp
  }
  
  func listNodeToArray(_ head: ListNode?) -> [Int] {
    var result: [Int] = []
    var realHead = head
    while realHead != nil {
      result.append(realHead!.val)
      realHead = realHead?.next
    }
    return result
  }
}
