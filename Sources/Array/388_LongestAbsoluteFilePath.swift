//
//  388_LongestAbsoluteFilePath.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-12-03.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

class LongestAbsoluteFilePath_Solution {
  func lengthLongestPath(_ input: String) -> Int {
    guard input.characters.count > 0 else {
      return 0
    }
    var sumCount = [Int]()
    var validIndex = 0
    var currentLP: Int = 0
    let inputCharacters = Array(input.characters)
    // count the path compent length.
    var currentPathComponentLength = 0
    // The tab level for this file tree.
    var currentTabLevel = 0
    // Indicate we are in the process of parsing.
    var structureParsing = false
    
    var meetWithAFile = false

    var currentIndex = 0
    while currentIndex < inputCharacters.count {
      if inputCharacters[currentIndex] == "." {
        meetWithAFile = true
      }
      if inputCharacters[currentIndex] != "\n" &&
        inputCharacters[currentIndex] != "\t" &&
        !structureParsing {
        currentPathComponentLength += 1
        currentIndex += 1
      } else if inputCharacters[currentIndex] != "\n" &&
        inputCharacters[currentIndex] != "\t" &&
        structureParsing {
        currentPathComponentLength = 1
        structureParsing = false
        currentIndex += 1
      } else if inputCharacters[currentIndex] == "\n" {
        if sumCount.count <= currentTabLevel && sumCount.count == 0 {
          sumCount.append(currentPathComponentLength)
          validIndex = 0
        } else if sumCount.count <= currentTabLevel {
          sumCount.append(currentPathComponentLength + sumCount.last!)
          validIndex = sumCount.count - 1
        } else if sumCount.count > currentTabLevel && currentTabLevel > 0 {
          sumCount[currentTabLevel] =
            sumCount[currentTabLevel - 1] + currentPathComponentLength
          validIndex = currentTabLevel
        } else {
          sumCount[0] = currentPathComponentLength
          validIndex = 0
        }
        if sumCount[validIndex] + validIndex > currentLP {
          currentLP = sumCount[validIndex] + validIndex
        }
        structureParsing = true
        currentIndex += 1
        currentTabLevel = 0
      } else if inputCharacters[currentIndex] == "\t" {
        currentTabLevel += 1
        currentIndex += 1
      }
    }
    if sumCount.count <= currentTabLevel && sumCount.count == 0 {
      sumCount.append(currentPathComponentLength)
      validIndex = 0
    } else if sumCount.count <= currentTabLevel {
      sumCount.append(currentPathComponentLength + sumCount.last!)
      validIndex = sumCount.count - 1
    } else if sumCount.count > currentTabLevel && currentTabLevel > 0 {
      sumCount[currentTabLevel] =
        sumCount[currentTabLevel - 1] + currentPathComponentLength
      validIndex = currentTabLevel
    } else {
      sumCount[0] = currentPathComponentLength
      validIndex = 0
    }
    if sumCount[validIndex] + validIndex > currentLP {
      currentLP = sumCount[validIndex] + validIndex
    }
    return meetWithAFile ? currentLP : 0
  }
  
  func test() {
    let result = lengthLongestPath("a\n\taa\n\t\taaa\n\t\t\tfile1234567890123.txt\naaaaaaaaaaaaaaaaaaaaa\n\tsth.png")
    if result == 32 {
      print("Pass Test")
    } else {
      print("Failed Test")
    }
  }
}
