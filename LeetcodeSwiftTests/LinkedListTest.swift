//
//  LinkedListTest.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-28.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import XCTest
@testable import LeetcodeSwift

class LinkedListTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

  func testEmpty() {
    let testLinkedList = LinkedList<String>()
    XCTAssert(testLinkedList.isEmpty)
  }
  
  func testPrint() {
    let testLinkedList = LinkedList<String>()
    XCTAssert(testLinkedList.description == "Empty")
  }
  
  func testAppend() {
    let testLinkedList = LinkedList<String>()
    XCTAssert(testLinkedList.description == "Empty")
    testLinkedList.append("Hello")
    testLinkedList.append("World")
    print(testLinkedList.description)
    XCTAssert(testLinkedList.description == "Node(v:Hello)->Node(v:World)->NULL")
  }
  
  func testInsertAtHead() {
    let testLinkedList = LinkedList<String>()
    XCTAssert(testLinkedList.description == "Empty")
    testLinkedList.insertAtHead("Hello")
    testLinkedList.insertAtHead("World")
    print(testLinkedList.description)
    XCTAssert(testLinkedList.description == "Node(v:World)->Node(v:Hello)->NULL")
  }
  
  func testSubSubscription() {
    let testLinkedList = LinkedList<String>()
    testLinkedList.insertAtHead("Hello")
    testLinkedList.insertAtHead("World")
    XCTAssert(testLinkedList[1] == "Hello")
  }
  
  func testElementFind() {
    let testLinkedList = LinkedList<Int>()
    testLinkedList.append(1)
    testLinkedList.append(2)
    testLinkedList.append(3)
    let (beforeOne, afterOne) = testLinkedList.beforAndAfterElementAt(0)
    let (beforeTwo, afterTwo) = testLinkedList.beforAndAfterElementAt(1)
    let (beforeThree, afterThree) = testLinkedList.beforAndAfterElementAt(2)
    XCTAssert(beforeOne == nil)
    XCTAssert(afterOne!.value == 2)
    XCTAssert(beforeTwo!.value == 1)
    XCTAssert(afterTwo!.value == 3)
    XCTAssert(beforeThree!.value == 2)
    XCTAssert(afterThree == nil)
  }
  
  func testElementRemove() {
    let testLinkedList = LinkedList<Int>()
    testLinkedList.append(1)
    testLinkedList.append(2)
    testLinkedList.append(3)
    testLinkedList.removeElementAt(1)
    XCTAssert(testLinkedList.description == "Node(v:1)->Node(v:3)->NULL")
    testLinkedList.removeElementAt(1)
    XCTAssert(testLinkedList.description == "Node(v:1)->NULL")
    testLinkedList.removeElementAt(0)
    XCTAssert(testLinkedList.description == "Empty")
    XCTAssert(testLinkedList.count == 0)
  }
  
  func testElementRemoveLast() {
    let testLinkedList = LinkedList<Int>()
    testLinkedList.append(1)
    testLinkedList.append(2)
    testLinkedList.append(3)
    testLinkedList.removeLastElement()
    XCTAssert(testLinkedList.description == "Node(v:1)->Node(v:2)->NULL")
    testLinkedList.removeLastElement()
    XCTAssert(testLinkedList.description == "Node(v:1)->NULL")
    testLinkedList.removeElementAt(0)
    XCTAssert(testLinkedList.description == "Empty")
    XCTAssert(testLinkedList.count == 0)
  }
  
  func testElementRemoveFirst() {
    let testLinkedList = LinkedList<Int>()
    testLinkedList.append(1)
    testLinkedList.append(2)
    testLinkedList.append(3)
    testLinkedList.removeFirstElement()
    XCTAssert(testLinkedList.description == "Node(v:2)->Node(v:3)->NULL")
    testLinkedList.removeFirstElement()
    XCTAssert(testLinkedList.description == "Node(v:3)->NULL")
    testLinkedList.removeFirstElement()
    XCTAssert(testLinkedList.description == "Empty")
    XCTAssert(testLinkedList.count == 0)
  }
  
  func testLinkedListGeneration() {
    let array: [Int] = [2, 3]
    let testLinkedList = LinkedList.generateLinkedListFromSequence(array)
    XCTAssert(testLinkedList.description == "Node(v:2)->Node(v:3)->NULL")
  }
}
