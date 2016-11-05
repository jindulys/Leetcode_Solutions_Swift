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
		let test = EditDistance_Solution()
		test.test()
    let testFourSum = FourSum_Solution()
    testFourSum.test()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

