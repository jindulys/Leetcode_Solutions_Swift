//
//  ArrayExtensionTest.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-25.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import XCTest
@testable import LeetcodeSwift

class ArrayExtensionTest: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testLongestCommonSubsequence() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let testStringX = ["X", "M", "J", "Y", "A", "U", "Z"]
    var testStringY = ["X", "M", "J", "Y", "A", "U", "Z"]
    XCTAssert(testStringX.LCS(testStringY) == ["X", "M", "J", "Y", "A", "U", "Z"], "Pass")
    testStringY = ["M", "Z", "J", "A", "W", "X", "U"]
    XCTAssert(testStringX.LCS(testStringY) == ["M", "J", "A", "U"], "Pass")
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
