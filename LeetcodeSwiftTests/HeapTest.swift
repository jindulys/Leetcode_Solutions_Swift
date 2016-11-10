//
//  HeapTest.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-09.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import XCTest

@testable import LeetcodeSwift

class HeapTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

  func testPeak() {
    var testMaxHeap = MaxHeap<Int>()
    testMaxHeap.insert(10)
    testMaxHeap.insert(1)
    testMaxHeap.insert(100)
    XCTAssert(testMaxHeap.peak()! == 100)
  }

  func testRemove() {
    var testMaxHeap = MaxHeap<Int>()
    testMaxHeap.insert(10)
    testMaxHeap.insert(1)
    testMaxHeap.insert(100)
    XCTAssert(testMaxHeap.remove()! == 100)
    XCTAssert(testMaxHeap.remove()! == 10)
    XCTAssert(testMaxHeap.remove()! == 1)
    XCTAssert(testMaxHeap.remove() == nil)
  }

  func testHeapCheck() {
    let testMaxHeapArray = [10, 7, 2, 5, 1]
    XCTAssert(MaxHeap.arrayIsMaxHeap(testMaxHeapArray))
    let testNonMaxHeapArray = [1, 2, 3, 4, 5]
    XCTAssert(!MaxHeap.arrayIsMaxHeap(testNonMaxHeapArray))
  }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
