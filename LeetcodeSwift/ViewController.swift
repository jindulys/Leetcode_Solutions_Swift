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
    let solution = SentenceScreenFitting_Solution()
    solution.test()
    let calculator = BasicCalculatorIII()
//    let result = calculator.calculate("123456")
//    print(result)
//    let result1 = calculator.calculate("1 + 2 + 3 + 4")
//    print(result)
    let result2 = calculator.calculate("7+6*(1+5)/12")
    print(result2)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

