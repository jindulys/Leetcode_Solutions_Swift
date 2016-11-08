//
//  83_PartitionList.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-07.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:86 Partition List
	URL: https://leetcode.com/problems/partition-list/
	Space: O(1)
	Time: O(N)
 */

class PartitionList_Solution {
  func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    let prevDummy = ListNode(0)
    var prev: ListNode? = prevDummy
    let postDummy = ListNode(0)
    var post: ListNode? = postDummy
    var checkingNode = head
    while let validCheckingNode = checkingNode {
      checkingNode = validCheckingNode.next
      if validCheckingNode.val < x {
        prev?.next = validCheckingNode
        prev = prev?.next
      } else {
        post?.next = validCheckingNode
        post = post?.next
      }
    }
    post?.next = nil
    prev?.next = postDummy.next
    return prevDummy.next
  }
}
