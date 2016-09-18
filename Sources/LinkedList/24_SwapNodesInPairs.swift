//
//  24_SwapNodesInPairs.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:24 Swap Nodes in Pairs
	URL: https://leetcode.com/problems/swap-nodes-in-pairs/
	Space: O(1)
	Time: O(n)
 */

class SwapNodesInPairs_Solution {
  func swapPairs(_ head: ListNode?) -> ListNode? {
    guard head != nil && head?.next != nil else {
      return head
    }
    let dummy = ListNode(0)
    dummy.next = head
    var prev: ListNode? = dummy
    var first = head
    var sec = head?.next
    while let validSec = sec {
      let next = validSec.next
      prev?.next = validSec
      validSec.next = first
      first?.next = next
      if next == nil {
        break
      }
      prev = first
      first = next
      sec = next?.next
    }
    return dummy.next
  }
}
