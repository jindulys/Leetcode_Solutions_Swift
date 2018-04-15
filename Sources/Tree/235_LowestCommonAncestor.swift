//
//  235_LowestCommonAncestor.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-04.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:235 Lowest Common Ancestor of a Binary Search Tree
	URL: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
	Space: O(n)
	Time: O(n)
 */

class LowestCommonAncestorOfABinarySearchTree_Solution {
//  func lowestCommonAncestorForRoot(_ root: TreeNode,
//                                   p: TreeNode,
//                                   q: TreeNode) -> TreeNode? {
//    // This implementation has a bug where p or q itself is the answer.
//    if let result = lowestCommonAncestorForRoot_Helper(root, p: p, q: q)
//      , result.val != p.val && result.val != q.val {
//      return result
//    }
//    return nil
//  }
//  func lowestCommonAncestorForRoot_Helper(_ root: TreeNode,
//                                          p: TreeNode,
//                                          q: TreeNode) -> TreeNode? {
//    if root.val == p.val || root.val == q.val {
//      return root
//    }
//    var leftResult: TreeNode?
//    if let left = root.left {
//      leftResult = lowestCommonAncestorForRoot_Helper(left, p: p, q: q)
//    }
//    var rightResult: TreeNode?
//    if let right = root.right {
//      rightResult = lowestCommonAncestorForRoot_Helper(right, p: p, q: q)
//    }
//    if let _ = leftResult, let _ = rightResult {
//      return root
//    }
//    if let left = leftResult {
//      return left
//    }
//    if let right = rightResult {
//      return right
//    }
//    return nil
//  }

  func lowestCommonAncestorForRootCorrect(_ root: TreeNode, p: TreeNode, q: TreeNode) -> TreeNode? {
    let (resultNode, count) = lowestCommonAncestorForRootHelperCorrect(root, p: p, q: q, found: 0)
    if count == 2 {
      return resultNode
    }
    return nil
  }

  func lowestCommonAncestorForRootHelperCorrect(_ root: TreeNode,
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
      (leftResult, leftFound) = lowestCommonAncestorForRootHelperCorrect(left, p: p, q: q, found: currentFound)
      if leftFound == 2 {
        return (leftResult, leftFound)
      }
    }
    if let right = root.right {
      (rightResult, rightFound) = lowestCommonAncestorForRootHelperCorrect(right, p: p , q: q, found: currentFound)
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
  
  func test() {
    let node6 = TreeNode(6)
    let node2 = TreeNode(2)
    let node8 = TreeNode(8)
    let node0 = TreeNode(0)
    let node4 = TreeNode(4)
    let node3 = TreeNode(3)
    let node5 = TreeNode(5)
    let node7 = TreeNode(7)
    let node9 = TreeNode(9)
    node6.left = node2
    node6.right = node8
    node2.left = node0
    node2.right = node4
    node4.left = node3
    node4.right = node5
    node8.left = node7
    node8.right = node9
    
    // Test1
    let test1 = lowestCommonAncestorForRoot(node6, p: node2, q: node8)
    if let test1Result = test1 , test1Result.val == 6 {
      print("Pass")
    } else {
      print("Failed")
    }
    // Test2
    let test2 = lowestCommonAncestorForRoot(node6, p: node0, q: node9)
    if let test2Result = test2 , test2Result.val == 6 {
      print("Pass")
    } else {
      print("Failed")
    }
    // Test3
    let test3 = lowestCommonAncestorForRoot(node6, p: node3, q: node5)
    if let test3Result = test3 , test3Result.val == 4{
      print("Pass")
    } else {
      print("Failed")
    }
    let testDummy = TreeNode(100)
    // Test6
    let test6 = lowestCommonAncestorForRoot(node6, p: testDummy, q: node5)
    if let _ = test6 {
      print("Failed")
    } else {
      print("Pass")
    }
  }
}
