//
//  143_ReorderList.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-07.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:141 Reorder List
	URL: https://leetcode.com/problems/reorder-list/
	Space: O(1)
	Time: O(N)
 */

class ReorderList_Solution {
  func reorderList(_ head: ListNode?) {
    guard head != nil && head?.next != nil else {
      return
    }
    var prev: ListNode? = head
    var post: ListNode? = head?.next
    while post != nil && post?.next != nil {
      prev = prev?.next
      post = post?.next?.next
    }

    post = prev?.next
    prev?.next = nil
    post = self.reverseNode(post)
    prev = head
    
    // NOTE: here post could be nil, prev could be nil or has value
    // but not the way around, because if post is not nil prev will always preceed to next.
    while post != nil && prev != nil {
      let postNext = post?.next
      let prevNext = prev?.next

      prev?.next = post
      post?.next = prevNext

      post = postNext
      prev = prevNext
    }
  }
  
  func reverseNode(_ head: ListNode?) -> ListNode? {
    var checkingNode = head
    var newNext: ListNode? = nil
    while let validCheckingNode = checkingNode {
      checkingNode = validCheckingNode.next
      validCheckingNode.next = newNext
      newNext = validCheckingNode
    }
    return newNext
  }
}
