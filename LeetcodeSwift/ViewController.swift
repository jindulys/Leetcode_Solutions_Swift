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
    let shopping = ShoppingOffers()
    let res = shopping.shoppingOffers([2, 5], [[3, 0, 5], [1, 2, 10]], [3, 2])
    print(res)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

