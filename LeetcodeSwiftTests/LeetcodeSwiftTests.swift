//
//  LeetcodeSwiftTests.swift
//  LeetcodeSwiftTests
//
//  Created by yansong li on 2016-08-07.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import XCTest
@testable import LeetcodeSwift

class LeetcodeSwiftTests: XCTestCase {
    
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
  func testSequenceSubTract() {
    let testArray = [1, 2, 6]
    let toRemove = [2]
    let normalResult = testArray.subtract(toRemove)
    XCTAssert(normalResult == [1, 6], "Pass")
    let emptyArray: [Int] = []
    let emptyResult = testArray.subtract(emptyArray)
    XCTAssert(emptyResult == [1, 2, 6] , "Pass")
  }
  
}
