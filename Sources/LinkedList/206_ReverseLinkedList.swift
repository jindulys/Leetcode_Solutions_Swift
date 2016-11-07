//
//  206_ReverseLinkedList.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:206 Reverse LinkedList
	URL: https://leetcode.com/problems/reverse-linked-list/
	Space: O(1)
	Time: O(N)
 */

class ReverseLinkedList_Solution {
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
}
