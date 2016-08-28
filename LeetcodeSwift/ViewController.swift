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
    // Do any additional setup after loading the view, typically from a nib.
    let solution = LongestCommonPrefix_Solution()
    let result = solution.longestCommonPrefix([])
    print(result)
    let twoSum = TwoSum_Solution()
    let twoSum_result = twoSum.twoSum([0, 4 , 3, 0], 0)
    print(twoSum_result)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

