//
//  236_LowestCommonAncestorBinaryTree.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-03-28.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

import Foundation

/**
  Title:236 Lowest Common Ancestor of a Binary Tree
  URL: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/description/
  Space: O(n)
  Time: O(n)
 */

func lowestCommonAncestorForRoot(_ root: TreeNode, p: TreeNode, q: TreeNode) -> TreeNode? {
  let (resultNode, count) = lowestCommonAncestorForRootHelper(root, p: p, q: q, found: 0)
  if count == 2 {
    return resultNode
  }
  return nil
}

func lowestCommonAncestorForRootHelper(_ root: TreeNode,
                                       p: TreeNode,
                                       q: TreeNode,
                                       found: Int) -> (TreeNode?, Int) {
  var currentFound: Int = 0
  if root.val == p.val || root.val == q.val {
    if found == 1 {
      return (root, 2)
    }
    currentFound = 1
  }
  var leftResult: TreeNode?
  var leftFound: Int = 0
  var rightResult: TreeNode?
  var rightFound: Int = 0
  if let left = root.left {
    (leftResult, leftFound) = lowestCommonAncestorForRootHelper(left, p: p, q: q, found: currentFound)
    if leftFound == 2 {
      return (leftResult, leftFound)
    }
  }
  if let right = root.right {
    (rightResult, rightFound) = lowestCommonAncestorForRootHelper(right, p: p , q: q, found: currentFound)
    if rightFound == 2 {
      return (rightResult, rightFound)
    }
  }
  if (currentFound + leftFound + rightFound) == 2 {
    return (root, 2)
  }
  if leftFound == 1 {
    return (leftResult, 1)
  }
  if rightFound == 1 {
    return (rightResult, 1)
  }
  if currentFound == 1 {
    return (root, 1)
  }
  return (nil, 0)
}
