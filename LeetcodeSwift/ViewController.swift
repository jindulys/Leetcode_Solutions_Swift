//
//  ViewController.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-07.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let palindrome = LongestPalindrome()
    print(palindrome.longestPalindrome("abccccdd"))
    let pT = PrintBinaryTree()
    let testRoot = TreeNode(1)
    let left = TreeNode(2)
    let right = TreeNode(3)
    let leftRight = TreeNode(4)
    left.right = leftRight
    testRoot.left = left
    testRoot.right = right
    print(pT.printTree(testRoot))
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

