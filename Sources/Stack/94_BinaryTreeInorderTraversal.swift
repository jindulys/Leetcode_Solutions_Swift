//
//  94_BinaryTreeInorderTraversal.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-08.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:94 Binary Tree Ignorer Traversal
	URL: https://leetcode.com/problems/binary-tree-inorder-traversal/
	Space: O(N)
	Time: O(N)
 */
class BinaryTreeInorderTraversal_Solution {
  func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var nodeStack: List<TreeNode> = .end
    var currentNode = root
    var result: [Int] = []
    while currentNode != nil || !nodeStack.isEmpty() {
      while let validNode = currentNode {
        nodeStack.push(validNode)
        currentNode = validNode.left
      }
      let leftMostNode = nodeStack.pop()
      result.append(leftMostNode!.val)
      currentNode = leftMostNode?.right
    }
    return result
  }
}
