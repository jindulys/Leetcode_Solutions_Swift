//
//  144_BinaryTreePreorderTraversal.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-07.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:144 Binary Tree Preorder Traversal
	URL: https://leetcode.com/problems/binary-tree-preorder-traversal/
	Space: O(N)
	Time: O(N)
 */

class BinarySolution {
  func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var stack: List<TreeNode> = .end
    var result: [Int] = []
    guard let validRoot = root else {
      return result
    }
    stack.push(validRoot)
    while let checkingNode = stack.pop() {
      result.append(checkingNode.val)
      if let rightNode = checkingNode.right {
        stack.push(rightNode)
      }
      if let leftNode = checkingNode.left {
        stack.push(leftNode)
      }
    }
    return result
  }

  func preorderTraversal_Array(_ root: TreeNode?) -> [Int] {
    var stack: [TreeNode] = []
    var result: [Int] = []
    guard let validRoot = root else {
      return result
    }
    stack.push(validRoot)
    while let checkingNode = stack.pop() {
      result.append(checkingNode.val)
      if let rightNode = checkingNode.right {
        stack.push(rightNode)
      }
      if let leftNode = checkingNode.left {
        stack.push(leftNode)
      }
    }
    return result
  }
}
