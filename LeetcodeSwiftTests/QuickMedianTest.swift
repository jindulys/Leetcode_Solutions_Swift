//
//  QuickMedianTest.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-12.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import XCTest

@testable import LeetcodeSwift

class QuickMedianTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
  func testPeak() {
    var testMedian = QuickMedian<Int>()
    testMedian.add(10)
    testMedian.add(100)
    testMedian.add(8)
    testMedian.add(18)
    testMedian.add(30)
    testMedian.add(80)
    testMedian.add(26)
    XCTAssert(testMedian.popMedian()! == 26)
  }    
}
