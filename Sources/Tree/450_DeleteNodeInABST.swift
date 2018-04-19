//
//  450_DeleteNodeInABST.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-18.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

/**
 Title: 450 Delete Node in A BST
 URL: https://leetcode.com/problems/delete-node-in-a-bst/description/
 Space: O(1)
 Time: O(lgn)
 */
class DeleteNodeInABST {
  func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let validRoot = root else {
      return nil
    }
    if validRoot.val < key {
      validRoot.right = deleteNode(validRoot.right, key)
    } else if validRoot.val > key {
      validRoot.left = deleteNode(validRoot.left, key)
    } else {
      if validRoot.left == nil || validRoot.right == nil {
        return validRoot.left == nil ? validRoot.right : validRoot.left
      } else {
        var checkingNode = validRoot.right
        var theSmallest = checkingNode!.val
        while let validNode = checkingNode {
          theSmallest = validNode.val
          checkingNode = validNode.left
        }
        validRoot.val = theSmallest
        validRoot.right = deleteNode(validRoot.right, theSmallest)
      }
    }
    return validRoot
  }
}
