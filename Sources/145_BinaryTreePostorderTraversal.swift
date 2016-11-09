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
	Time: O(N^2)
 */

class BinaryTreePostOrderTraversal_Solution {
  func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var stack: [TreeNode] = []
    var result: [Int] = []
    guard let validRoot = root else {
      return result
    }
    stack.push(validRoot)
    while let checkingNode = stack.pop() {
      result.insert(checkingNode.val, at: 0)
      if let leftNode = checkingNode.left {
        stack.push(leftNode)
      }
      if let rightNode = checkingNode.right {
        stack.push(rightNode)
      }
    }
    return result
  }
}
